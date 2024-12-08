const std = @import("std");

pub fn main() !void {

    // Strings em zig são arrays de bytes (u8) terminadas em 0 (null terminated)
    const my_str = "Hello World!"; // deve se utilizar aspas dupla pra strings

    // Para imprimir strings, usar {s}
    std.debug.print("my_str: {s}\n\n", .{my_str});

    // Podemos declarar como um vetor de caracteres
    var var_str = [_]u8{ 's', 't', 'r', 'i', 'n', 'g', '.', '.', '.' };
    // Caracteres seguem aspas simples
    var_str[6] = '!';
    var_str[7] = '!';
    var_str[8] = '!';
    std.debug.print("var_str: {s} len {}\n\n", .{ var_str, var_str.len });

    // Para concatenar string
    const hello = "oi";
    const concat = "concatenado";
    const hello_concat = hello ++ " " ++ concat;
    std.debug.print("hello_concat: {s}\n\n", .{hello_concat});

    // Também podemos fazer strings de várias linhas nativamente
    const multiline_string =
        \\Eu fui embora, meu amor chorou
        \\Eu fui embora, meu amor chorou
        \\Eu fui embora, meu amor chorou
        \\Eu fui embora, meu amor chorou
        \\Vou voltar
        \\
        \\Eu vou nas asas de um passarinho
        \\Eu vou nos beijos de um beija-flor
        \\Eu vou nas asas de um passarinho
        \\Eu vou nos beijos de um beija-flor
        \\No tic-tic-tac do meu coração renascerá
        \\No tic-tic-tac do meu coração renascerá
    ;
    std.debug.print("multiline: \n{s}\n\n", .{multiline_string});

    // Em C strings são vetores de bytes terminados com \0.
    // Uma string em Zig já é por padrão feita como uma array terminada em \0.
    // Mas muitas vezes é importante reforçar esse padrão para ter interoperabilidade
    // com bibliotecas em C. Para isso podemos fazer:

    // [100:0]:
    // 100 é o tamanho da array
    // 0 será adicionado ao final da array, então ela se torna uma array terminada com 0
    var giant_array: [100:0]u8 = undefined; // não inicializada
    // Imprimindo a string no vetor
    // giant_str aqui é um slice desse vetor
    const giant_str = try std.fmt.bufPrint(&giant_array, "{s}", .{"abc"});
    std.debug.print("giant_array\nstring full: {s}\narray: {s}\n\n", .{ giant_str, giant_array });

    // Podemos também usar funções para parse de strings
    const my_int = try std.fmt.parseInt(u32, "42", 10);
    const my_float = try std.fmt.parseFloat(f32, "3.14159265359");
    std.debug.print("my int {d} my float {d:.2}", .{ my_int, my_float });

    // Lista completa de modificadores
    // https://ziglang.org/documentation/master/std/#std.fmt.format
    //
    // x and X: output numeric value in hexadecimal notation
    // s:
    //     for pointer-to-many and C pointers of u8, print as a C-string using zero-termination
    //     for slices of u8, print the entire slice as a string without zero-termination
    // e: output floating point value in scientific notation
    // d: output numeric value in decimal notation
    // b: output integer value in binary notation
    // o: output integer value in octal notation
    // c: output integer as an ASCII character. Integer type must have 8 bits at max.
    // u: output integer as an UTF-8 sequence. Integer type must have 21 bits at max.
    // ?: output optional value as either the unwrapped value, or null; may be followed by a format specifier for the underlying value.
    // !: output error union value as either the unwrapped value, or the formatted error value; may be followed by a format specifier for the underlying value.
    // *: output the address of the value instead of the value itself.
    // any: output a value of any type using its default format.

    // Sobre formatação
    // https://ziglang.org/documentation/master/std/#std.fmt.format
    // The format string must be comptime-known and may contain placeholders following this format: {[argument][specifier]:[fill][alignment][width].[precision]}

}
