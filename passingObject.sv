program test;
    class BusTran;
        int addr, data;
    endclass
    
    task transmit(BusTran bt);
        $display("BusTran %0d, %0d is transmitted",bt.addr,bt.data);
    endtask
    
    BusTran b;
    
    initial begin
        b=new;
        b.addr=1;
        b.data=2;
        transmit(b);
    end
endprogram