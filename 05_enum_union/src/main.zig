const std = @import("std");

const Language = enum(u8) {
    ptbr,
    en,
    pt,
    fr,

    pub fn is_ptbr(self: @This()) bool {
        return self == .ptbr;
    }
};

pub fn main() !void {
    print_hello_world(@enumFromInt(0));
    print_hello_world(@enumFromInt(1));
    print_hello_world(@enumFromInt(2));
    print_hello_world(@enumFromInt(3));

    var value = calc_values(10, 0);
    value = Result{ .ok = 40 };
    value = Result{ .not_ok = ErrorCond.sys };

    std.debug.print("my value {}\n", .{value});
}

fn print_hello_world(lang: Language) void {
    std.debug.print("Mensagem em {s} {}: ", .{ @tagName(lang), lang.is_ptbr() });
    switch (lang) {
        .en => std.debug.print("Hello World!\n", .{}),
        .ptbr => std.debug.print("Oi Mundo!\n", .{}),
        .pt => std.debug.print("Olá Mundo!\n", .{}),
        .fr => std.debug.print("Bonjour le monde!\n", .{}),
    }
}

const ErrorCond = enum(u2) {
    sys = 1,
    user = 2,
    unknown = 3,
};

const Result = union(enum) {
    ok: u32,
    not_ok: ErrorCond,
};

pub fn calc_values(a: u32, b: u32) Result {
    if (b == 0) {
        return Result{ .not_ok = ErrorCond.user };
    }
    return Result{ .ok = a / b };
}
