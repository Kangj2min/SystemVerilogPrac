

program Instantitation;
    class BusTran;
        logic [31:0] addr,crc, data[4];
        
        function new (logic [31:0] addr=3, d=5);
            this.addr = addr;
            foreach (data[i])
                data[i] = d;
         endfunction
         
         function void display();
            $display("Addr: %h",addr);
            foreach (data[i])
                $display("Data[%d]: %h",i,data[i]);
         endfunction
   endclass
   
   initial begin
    BusTran a,b,c;
    a = new();
    a.disply();
    b= new(10);
    b.display();
    c=new(1,1);
    c.display();
    end
  endprogram
