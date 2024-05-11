program Randomization;
    class Packet;
        // The random variables
        rand bit [31:0] src, dst, data[8];
        randc bit [1:0] kind;
        // Limit the values for src
        constraint c {src > 10; src < 15;}
        
        function void display();
            $display("Src: %0d, Dst: %0d, Kind:%0d",src,dst,kind);
        endfunction
     endclass
     
     Packet p;
     
     initial begin 
        p = new ;
        for (int i=0;i<10;i++) begin
            assert (p.randonmize());
            p.display();
         end
      end
 endprogram