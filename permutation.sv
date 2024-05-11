program permutation;
    class RandcInside;
        int array[]; // Values to choose
        randc bit [15:0] index; //Index into array
        
        function new(input int a[]);
            array = a;
        endfunction
        
        function int pick;  //Return most recent pick 
            return array[index];
        endfunction
        
        constraint c_size {index < array.size;}
     endclass
     
     initial begin
        RandcInside ri;
        ri = new('{1,3,5,7,9,11,13});
        repeat (ri.array.size) begin
            assert (ri.randomize());
            $display ("Picked %2d [%0d]",ri.pick(),ri.index);
        end
      end
 endprogram