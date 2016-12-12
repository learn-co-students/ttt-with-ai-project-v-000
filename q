
[1mFrom:[0m /home/ubuntu/workspace/lib/players/computer.rb @ line 90 Players::Computer#move:

    [1;34m82[0m: [32mdef[0m [1;34mmove[0m(board)
    [1;34m83[0m:     [32mif[0m [1;36mself[0m.self_winning? 
    [1;34m84[0m:         [32mif[0m !board.taken?([1;36mself[0m.self_winning?[[1;34m1[0m])
    [1;34m85[0m:             add_move([1;36mself[0m.self_winning?[[1;34m1[0m])
    [1;34m86[0m:         [32mend[0m
    [1;34m87[0m:     [32melsif[0m [1;36mself[0m.opponent_winning?(board) 
    [1;34m88[0m:         [32mif[0m !board.taken?([1;36mself[0m.opponent_winning?(board)[[1;34m1[0m])
    [1;34m89[0m:             [1;36mself[0m.opponent_winning?(board)[[1;34m1[0m]
 => [1;34m90[0m:             binding.pry
    [1;34m91[0m:         [32mend[0m
    [1;34m92[0m:     [32melse[0m
    [1;34m93[0m:         choose_move(board)
    [1;34m94[0m:     [32mend[0m
    [1;34m95[0m: [32mend[0m

