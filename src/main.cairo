%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import get_contract_address, get_caller_address
from src.interfaces import ISecondary


@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    let (this) = get_contract_address();
    %{ print('main : ', hex(ids.this)) %}
    return ();
}


@external
func start{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(secondary_address:felt) {

    let (caller) = get_caller_address();

    %{ print('main.start') %}
    %{ print('caller : ',hex(ids.caller)) %}

    ISecondary.start(secondary_address);
    
    return ();
}

@external
func onCall{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {

    let (caller) = get_caller_address();
    %{ print('main.onCall') %}
    %{ print('caller : ',hex(ids.caller)) %}
    
    return ();
}