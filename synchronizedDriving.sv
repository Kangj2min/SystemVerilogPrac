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
        #2 arbif.cb.request <= 3; //@ 2ns
        #10 arbif.cb.request <=2; // @12ns
        #18 arbif.cb.request <=1; //@ 30ns
        #50 $finish;
    end
endprogram

module arb(arb_if.DUT arbif);
    initial 
        $monitor("@%0d: req=%h", $time, arbif.request);
endmodule

module SynchronizeDriving;
    bit clk=1;
    always #5 clk = ~clk;
    
    arb_if arbif(.*);
    arb a1(.*);
    test t1(.*);
endmodule : SynchronizeDriving