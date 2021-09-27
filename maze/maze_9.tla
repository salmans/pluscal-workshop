-------------------------------- MODULE maze --------------------------------
EXTENDS TLC, Integers, Sequences, FiniteSets

CONSTANTS maze

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
variables pos = CHOOSE p \in [x : 1..Height, y : 1..Width] :
    maze[p.x][p.y] = "*"

\* PlusCal algorithm:
begin Start:
while TRUE do
    either
      Up: if pos.x > 1 /\ maze[pos.x - 1][pos.y] /= "#" then
        pos.x := pos.x - 1;
      end if;
    or
      Down: if pos.x < Height /\ maze[pos.x + 1][pos.y] /= "#" then
        pos.x := pos.x + 1;
      end if;
    or
      Left: if pos.y > 1 /\ maze[pos.x][pos.y - 1] /= "#" then
        pos.y := pos.y - 1;
      end if;
    or
      Right: if pos.y < Width /\ maze[pos.x][pos.y + 1] /= "#" then
        pos.y := pos.y + 1;
      end if;
    end either; 
end while;

end algorithm; *)
=============================================================================