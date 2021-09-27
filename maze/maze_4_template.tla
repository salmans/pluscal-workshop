-------------------------------- MODULE maze --------------------------------
EXTENDS TLC, Integers, Sequences, FiniteSets

(* --algorithm
begin
variables x = 14, y = 1, maze = <<
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
>>, breadcrumb = <<>>;

\* PlusCal algorithm:
begin Start:
while TRUE do
    either
      Up: if x > 1 /\ maze[x - 1][y] /= "#" then
        x := x - 1;
        breadcrumb := Append(breadcrumb, "Up")
      end if;
    or
      Down: if x < 14 /\ maze[x + 1][y] /= "#" then
        x := x + 1;
        \* TODO
      end if;
    or
      Left: if y > 1 /\ maze[x][y - 1] /= "#" then
        y := y - 1;
        \* TODO        
      end if;
    or
      Right: if y < 14 /\ maze[x][y + 1] /= "#" then
        y := y + 1;
        \* TODO        
      end if;
    end either; 
end while;

end algorithm; *)
=============================================================================