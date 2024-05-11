program randcase;
    initial begin
        int len;
        for(int i=0; i<10; i++) begin
            randcase
            1: len = $urandom_range(0,2); // 10%: 0, 1, or 2
            8: len = $urandom_range(3,5); // 80%: 3, 4, or 5
            1: len = $urandom_range(6,7); // 10%: 6 or 7
            endcase
            $display("len=%0d", len);
         end
      end
endprogram