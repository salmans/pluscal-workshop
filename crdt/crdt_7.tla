--------------------------- MODULE crdt ---------------------------
EXTENDS Integers, Sequences, FiniteSets

CONSTANTS NULL, Processes, MaxUpdates, Drop, Reorder, MaxDups

\* Operators:
Max(x, y) == IF x > y THEN x ELSE y

RECURSIVE Fold(_, _, _)
Fold(Op(_, _), s, r) == IF s = <<>> 
  THEN r
  ELSE LET x == Head(s)
    IN Fold(Op, Tail(s), Op(x, r))

RECURSIVE FuncValuesHelper(_, _) 
FuncValuesHelper(f, d) == IF d = {}
  THEN <<>>
  ELSE LET k == CHOOSE i \in d: TRUE
    IN Append(FuncValuesHelper(f, d \ {k}), f[k])
    
FuncValues(f) == FuncValuesHelper(f, DOMAIN f)

Sum(f) == 
  LET op(x, y) == x + y
      vs == FuncValues(f)
  IN Fold(op, vs, 0)

(* --algorithm
begin
  variable msg_queue = [p \in Processes |-> <<>>], oracle = 0;
  
fair process Member \in Processes
  variable local = [p \in Processes |-> 0],
    remote = NULL,
    updates = 0;
  
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
            local[self] := local[self] + 1;
            oracle := oracle + 1;
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
          local := [p \in Processes |-> Max(local[p], remote[p])];
        end if;
    end while;      
  end process;

process Network = 0
  variable i = 1, dups = 0, 
    proc_ids = CHOOSE p \in [ 1..Cardinality(Processes) -> Processes] : TRUE;
  
  begin NetStart:
    while TRUE do
      if msg_queue[proc_ids[i]] /= <<>> then
        either \* Drop a message
          if Drop then
            msg_queue[proc_ids[i]] := Tail(msg_queue[proc_ids[i]]);
          end if;
        or \* Duplicate a message
          if dups < MaxDups then
            msg_queue[proc_ids[i]] := Append(
              msg_queue[proc_ids[i]], 
              Head(msg_queue[proc_ids[i]])
            );
            dups := dups + 1;
          end if;
        or \* Reorder a message
          if Reorder then
            msg_queue[proc_ids[i]] := Append(
              Tail(msg_queue[proc_ids[i]]), 
              Head(msg_queue[proc_ids[i]])
            );
          end if;
        end either;
      end if;
      i := (i % Cardinality(Processes)) + 1;
    end while;
  end process;
end algorithm;
*)
=============================================================================