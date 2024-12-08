const std = @import("std");

fn private_function() void {
    std.debug.print("só módulo pode chamar funções privadas (sem 'pub')\n", .{});
}

pub fn pub_function() void {
    std.debug.print("Estou na função pública\n", .{});
    private_function();
}
