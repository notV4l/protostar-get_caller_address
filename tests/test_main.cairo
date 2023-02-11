%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

from src.interfaces import IMain

@external
func __setup__{syscall_ptr: felt*, range_check_ptr}() {
    alloc_locals;

    local admin = 'starknet-admin';
    local main: felt;
    local secondary: felt;

    %{
        context.admin = ids.admin
        context.main = deploy_contract("src/main.cairo", []).contract_address
        context.secondary = deploy_contract("src/secondary.cairo", []).contract_address
    %}

    return ();
}


@external
func test_caller{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local main: felt;
    local secondary: felt;

    %{
        ids.main = context.main
        ids.secondary = context.secondary
    %}

    IMain.start(main,secondary);

    return ();
}


@external
func test_caller_with_prank{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local admin: felt;
    local main: felt;
    local secondary: felt;

    %{
        ids.admin = context.admin
        ids.main = context.main
        ids.secondary = context.secondary
    %}

    %{ stop_prank = start_prank(ids.admin, target_contract_address=ids.main) %}
    IMain.start(main,secondary);
    %{ stop_prank() %}

    return ();
}