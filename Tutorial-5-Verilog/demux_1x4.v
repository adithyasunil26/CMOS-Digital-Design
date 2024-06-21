module demux_1x4(
    input wire y,
    input wire S_0,
    input wire S_1,
    output wire a,
    output wire b,
    output wire c,
    output wire d
);

//Internal wires
wire y0;
wire y1;

//First stage demux
demux_1x2 stage1 (
    .y(y),
    .S(S_1),
    .a(y0),
    .b(y1)
);

//Second stage demux
demux_1x2 stage2a(
    .y(y0),
    .S(S_0),
    .a(a),
    .b(b)
);

demux_1x2 stage2b(
    .y(y1),
    .S(S_0),
    .a(c),
    .b(d)
);
endmodule
