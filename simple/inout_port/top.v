module tristate (en, i, io, o);
    input en;
    input i;
    inout [1:0] io;    
    output [1:0] o;
`ifndef BUG    
	assign 	io[0] = (en)? i : 1'bZ;
		
    assign 	io[1] = (i)? en : 1'bZ;
		
    assign o = io;
`else
	assign 	io[0] = (en)? ~i : 1'bZ;
		
    assign 	io[1] = (i)? ~en : 1'bZ;
		
    assign o = ~io;
`endif

endmodule


module top (
input en,
input a,
inout [1:0] b,
output [1:0] c
);

tristate u_tri (
        .en (en ),
        .i (a ),
        .io (b ),
        .o (c )
    );

endmodule
