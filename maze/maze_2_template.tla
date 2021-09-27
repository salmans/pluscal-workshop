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
        \* TODO
        skip;
    or \* left
        \* TODO
        skip;
    or \* right
        \* TODO
        skip;
    end either; 
end while;

end algorithm; *)
=============================================================================