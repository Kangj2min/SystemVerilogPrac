program randsequence;
    initial begin
        for(int i=0; i<10; i++) begin
            randsequence (stream)
            stream : cfg_read :=1 | io_read := 2 | mem_read := 5;
            cfg_read : { cfg_read_task;} | { cfg_read_task;} cfg_read;
            mem_read : { mem_read_task;} | { mem_read_task;} mem_read;
            io_read : { io_read_task;} | { io_read_task;} io_read;
            endsequence  
        end // for
    end
    
task cfg_read_task;
    $display("cfg_read_task");
endtask
task mem_read_task;
    $display("mem_read_task");
endtask
task io_read_task;
    $display("io_read_task");
endtask
program