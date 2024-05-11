program randomSignVariable;
    class SignedVars;
        rand logic [7:0] pkt1_len, pkt2_len;
        constraint total_len {
            pkt1_len + pkt2_len == 64;
        }
    endclass
    
    initial begin
        SignedVars sv;
        sv = new;
        repeat (100) begin
            assert(sv.randomize());
            $display("%0d, %0d", sv.pkt1_len, sv.pkt2_len);
        end
    end
endprogram