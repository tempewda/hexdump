const std = @import("std");

pub fn main() !void {
    const file = try std.fs.cwd().openFile("test.txt", .{.mode = .read_only});
    defer file.close();

    var buffer: [16]u8 = undefined;
    var offset: usize = 0;

    while (true) {
        const bytes_read = try file.read(&buffer);

        if (bytes_read == 0)
            break;

        std.debug.print("{x:0>8}  ", .{offset});
        for (buffer[0..bytes_read]) |byte| 
            std.debug.print("{x:0>2} ", .{byte});   
        std.debug.print("\n", .{});

        offset += bytes_read;
    }  
}
