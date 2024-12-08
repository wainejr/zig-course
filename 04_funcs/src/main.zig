const std = @import("std");
const module = @import("mod.zig");

pub fn main() !void {
    const a: i32 = 10;
    const my_result = sum_vals(a, 30);

    std.debug.print("my_result: {}\n", .{my_result});

    var modifieble_var: i32 = 0;
    std.debug.print("modifiable_var: {}\n", .{modifieble_var});
    modify_reference(&modifieble_var);
    std.debug.print("modifiable_var: {}\n", .{modifieble_var});

    module.pub_function();
    const mod_const = module.exposed_const;
    std.debug.print("mod_const: {}\n", .{mod_const});
}

/// Sintaxe de uma função
/// [<classificador>] fn <nome da função>(<nome argumento>: <tipo argumento>, ...) <tipo retorno>
fn sum_vals(a: i32, b: i32) i32 {
    return a + b;
}

fn modify_reference(a: *i32) void {
    a.* = 42;
}
