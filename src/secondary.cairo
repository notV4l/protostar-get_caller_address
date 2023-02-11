%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.starknet.common.syscalls import get_contract_address, get_caller_address

from src.interfaces import IMain



@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    let (this) = get_contract_address();
    %{ print('secondary : ', hex(ids.this)) %}
    return ();
}


@external
func start{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {

    let (caller) = get_caller_address();

    %{ print('secondary.start') %}
    %{ print('caller : ',hex(ids.caller)) %}

    IMain.onCall(caller);
    
    return ();
}

