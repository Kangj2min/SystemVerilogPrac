
program Default_Argument;
    function void print_sum (ref int a[],
        input int start = 0,
        input int last = -1);
        
        int sum;
        sum =0;
        if (last ==-1 || last >a.size)
            last=a.size;
        for(int i=start; i<last; i++)
            sum += a[i];
         $display("The sum of the arrays is ",sum);
     endfunction
     
     int x[] = '{1,2,3,4,5};
     initial 
        begin
            print_sum(x);
            print_sum(x,2,5);
            print_sum(x,1);
            print_sum(x,,3);
         end
 endprogram 