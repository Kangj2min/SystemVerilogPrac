
program test_Procedual;
 initial
  begin : example
  integer array[10], sum, j;
  
  for(int i=0; i<10; ++i) 
    array[i] = i;
    sum = array[9];
    j=8;
    do
        sum += array[j];
     while (j--);
     $display("Sum=%4d",sum);
   end: example
 endprogram
 
