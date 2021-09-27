-------------------------------- MODULE maze --------------------------------
EXTENDS TLC, Integers, Sequences, FiniteSets

maze == <<
  <<"#", "#", " ", "#", "#", "#", "#", "#", "#", "#", " ", " ", " ", "$">>,
  <<"#", " ", " ", "#", " ", " ", " ", "#", "#", "#", " ", "#", "#", "#">>, 
  <<"#", " ", "#", "#", "#", "#", " ", " ", " ", " ", " ", " ", " ", "#">>,
  <<"#", " ", " ", " ", "#", "#", "#", "#", "#", "#", "#", "#", " ", "#">>, 
  <<"#", "#", "#", " ", "#", " ", "#", "#", " ", "#", "#", " ", " ", "#">>,
  <<"#", "#", "#", " ", " ", " ", "#", "#", " ", "#", "#", " ", "#", "#">>,
  <<"#", "#", "#", "#", "#", " ", "#", " ", " ", " ", " ", " ", "#", "#">>,
  <<"#", "#", " ", " ", " ", " ", "#", "#", "#", " ", "#", " ", "#", "#">>,
  <<"#", "#", " ", "#", "#", " ", " ", " ", "#", " ", "#", "#", "#", "#">>,
  <<"#", "#", " ", "#", "#", "#", "#", " ", " ", " ", "#", " ", "#", "#">>,
  <<"#", "#", " ", " ", "#", " ", "#", "#", "#", "#", "#", " ", "#", "#">>,
  <<"#", "#", "#", " ", "#", " ", " ", " ", " ", " ", " ", " ", " ", "#">>,
  <<" ", " ", " ", " ", " ", " ", "#", "#", "#", "#", "#", " ", "#", "#">>,
  <<"*", "#", " ", "#", "#", "#", "#", "#", "#", "#", "#", " ", "#", "#">>
>>
Height == Len(maze)
Width == Len(maze[CHOOSE i \in DOMAIN maze: TRUE])

\* Operators:
RECURSIVE Count(_, _)
Count(seq, item) == IF seq = <<>>
    THEN 0
    ELSE IF Head(seq) = item
        THEN Count(Tail(seq), item) + 1
        ELSE Count(Tail(seq), item)

RECURSIVE CountAll(_, _)
CountAll(seqs, item) == IF seqs = <<>>
    THEN 0
    ELSE Count(Head(seqs), item) + CountAll(Tail(seqs), item)

ASSUME CountAll(maze, "*") = 1
ASSUME CountAll(maze, "$") = 1
ASSUME \A i \in DOMAIN maze : Len(maze[i]) = Width
ASSUME \A i \in DOMAIN maze :
    \A j \in DOMAIN maze[i] : maze[i][j] \in {"*", "$", "#", " "}


(* --algorithm
begin
variables x = Height, y = 1;

\* PlusCal algorithm:
begin Start:
while TRUE do
    either
      Up: if x > 1 /\ maze[x - 1][y] /= "#" then
        x := x - 1;
      end if;
    or
      Down: if x < Height /\ maze[x + 1][y] /= "#" then
        x := x + 1;
      end if;
    or
      Left: if y > 1 /\ maze[x][y - 1] /= "#" then
        y := y - 1;
      end if;
    or
      Right: if y < Width /\ maze[x][y + 1] /= "#" then
        y := y + 1;
      end if;
    end either; 
end while;

end algorithm; *)
=============================================================================