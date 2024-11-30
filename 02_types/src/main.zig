const std = @import("std");

/// Assim como C, o ponto de entrada de Zig é a main
pub fn main() void {

    // Zig explicita o tamanho dos seus tipos inteiros e floats
    const foo: u8 = 0;
    const bar = 10;

    // Além disso, warnings são erros, e não usar uma variável
    // é um warning (ou seja, erro)
    std.debug.print("", args: anytype)
}
