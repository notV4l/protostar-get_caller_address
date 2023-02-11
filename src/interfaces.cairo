%lang starknet

@contract_interface
namespace IMain {
    func start(secondary_address:felt){
    }

    func onCall(){
    }
    
}

@contract_interface
namespace ISecondary {
    func start(){
    }
}