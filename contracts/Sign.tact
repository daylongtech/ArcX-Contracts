import "@stdlib/deploy";



struct Array {
    Address_sign_time: map<Address, Int>; 
    // length: Int = 0;              
}



contract signText with Deployable {
    array: Array;

    init() {
        self.array = Array{
            Address_sign_time: emptyMap(),
            // length: 0,
        }

    }

    receive("sign") {
        
        let value_id = self.array.Address_sign_time.get(context().sender);
        let local_time = now() / 86400;
      
        if ( value_id == null  || value_id!! < local_time) {
            self.array.Address_sign_time.set(context().sender,local_time);
            dump("签到成功");
        }else {
            require(false,"你已经签到过了，明天再来吧");
        }   
    }

    get fun  ArrayTime(): Array {
    return self.array;

    }


    get fun  addressBalance(): Int {
    return myBalance();

    }
}


   

