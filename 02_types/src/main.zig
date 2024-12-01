const std = @import("std");

/// Assim como C, o ponto de entrada de Zig é a main
pub fn main() void {
    // Zig explicita o tamanho dos seus tipos inteiros e floats
    const foo: u8 = 0;
    const my_float: f32 = 3.14;

    std.debug.print("foo={} my_float={}\n", .{ foo, my_float });

    // Para valores que não são constates, usar var
    var foo_var: i8 = 0;
    foo_var -= 10;

    std.debug.print("foo_var={}\n", .{foo_var});

    // Além disso, warnings são erros, e não usar uma variável
    // é um warning (ou seja, erro)
    const bar = 10;
    // para não dar erro, usar sintaxe
    _ = bar;

    // Uma variável pode ser utilizada apenas dentro do seu escopo
    {
        const foobar = 20;
        std.debug.print("foobar={}\n", .{foobar});
    }
    // Caso tentassemos acessar foobar aqui, haveria um erro
    // ERRO: std.debug.print("foobar={}\n", .{ foobar});

    var my_array: [4]i32 = .{ 0, 1, 2, 3 };
    my_array[1] += 10;

    std.debug.print("my_array={any}\n", .{my_array});
}
