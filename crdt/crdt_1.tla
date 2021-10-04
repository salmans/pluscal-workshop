--------------------------- MODULE crdt ---------------------------
EXTENDS Integers, Sequences, FiniteSets

CONSTANTS NULL, Processes

(* --algorithm
begin
process Member \in Processes
  variable local = 0;
  
  begin Start:
    while TRUE do
      (* 
        The process either (non-deterministically) updates (modifies) and broadcasts 
        its local value, or it doesn't. 
      *)
      either
        Update: \* Update        
          local := local + 1;
        Downstream: \* Broadcast
          skip; \* TODO
       or
        skip;
      end either;
      
      (*
        The process receives a remote value and merges it with its local value.
      *)
      Merge:
        skip; \* TODO
    end while;      
  end process;
end algorithm;
*)
=============================================================================