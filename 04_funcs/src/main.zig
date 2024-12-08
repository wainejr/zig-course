const std = @import("std");
const mod = @import("mod.zig");

pub fn main() !void {
    const my_result = sum_vals(10, 30);

    std.debug.print("my_result: {}\n", .{my_result});
}

fn sum_vals(a: i32, b: i32) i32 {
    return a + b;
}

fn modify_reference(a: *i32) void {
    a.* = 40;
}
