--------------------------- MODULE crdt_workshop ---------------------------
EXTENDS Integers, Sequences, FiniteSets

CONSTANTS NULL, Processes, MaxUpdates

\* Operators:
Max(x, y) == IF x > y THEN x ELSE y

(* --algorithm
begin
  variable msg_queue = [p \in Processes |-> <<>>];
  
fair process Member \in Processes
  variable local = 0, remote = NULL, updates = 0;
  
  begin Start:
    while TRUE do
      (* 
        The process either (non-deterministically) updates (modifies) and broadcasts 
        its local value, or it doesn't. 
      *)
      if updates < MaxUpdates then
        updates := updates + 1;
        either
          Update: \* Update        
            local := local + 1;
          Downstream: \* Broadcast
            msg_queue := [ 
              q \in DOMAIN msg_queue |-> IF q = self 
                THEN msg_queue[q] 
                ELSE Append(msg_queue[q], local)
            ];
         or
          skip;
        end either;
      end if;
      
      (*
        The process receives a remote value and merges it with its local value.
      *)
      Merge:
        if msg_queue[self] /= <<>> then
          remote := Head(msg_queue[self]);
          msg_queue[self] := Tail(msg_queue[self]);
          local := Max(local, remote);
        end if;
    end while;      
  end process;
end algorithm;
*)
=============================================================================