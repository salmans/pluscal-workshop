-------------------------------- MODULE maze --------------------------------
EXTENDS TLC, Integers, Sequences, FiniteSets

(* --algorithm
begin
variables x = 4, y = 1, maze = <<
  <<"#", " ", "#", "#", " ", "$">>,
  <<"#", " ", "#", " ", " ", "#">>,
  <<"#", " ", " ", " ", "#", "#">>,
  <<"*", " ", "#", "#", "#", "#">>
>>;

\* PlusCal algorithm:
begin Start:
while TRUE do
    either \* up
      if x > 1 /\ maze[x - 1][y] /= "#" then
        x := x - 1;
      end if;
    or \* down
      if x < 4 /\ maze[x + 1][y] /= "#" then
        x := x + 1;
      end if;
    or \* left
      if y > 1 /\ maze[x][y - 1] /= "#" then
        y := y - 1;
      end if;
    or \* right
      if y < 6 /\ maze[x][y + 1] /= "#" then
        y := y + 1;
      end if;
    end either; 
end while;

end algorithm; *)
=============================================================================