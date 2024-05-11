interface arb_if(input bit clk);
    logic [1:0] grant, request;
    logic reset;
    
    clocking cb @ (posedge clk);
        output request;
        input grant;
    endclocking
    
    modport TEST (clocking cb, output reset);
    modport DUT (input request,reset,output grant);
endinterface

program test(arb_if.TEST arbif);
    initial begin
        $monitor("@%0d: grant=%h",$time, arbif.cb.grant);
        #50;
     end
endprogram

module arb(arb_if.DUT arbif);
    initial begin
        arbif.grant=1; // @ 0ns
        #12 arbif.grant = 2; // @ 12ns
        #18 arbif.grant = 3; // @ 30ns
    end
endmodule

module top;
    bit clk=1;
    always #5 clk = ~clk;
    
    arb_if arbif(.*);
    arb a1(.*);
    test t1(.*);
endmodule : top