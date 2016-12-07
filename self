
[1mFrom:[0m /home/nickratti-21071/code/labs/ttt-with-ai-project-v-000/lib/game.rb @ line 102 Game#computer_ai:

    [1;34m101[0m: [32mdef[0m [1;34mcomputer_ai[0m
 => [1;34m102[0m:   binding.pry
    [1;34m103[0m:   valid_moves = [[31m[1;31m"[0m[31m1[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m2[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m3[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m4[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m5[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m6[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m7[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m8[1;31m"[0m[31m[0m, [31m[1;31m"[0m[31m9[1;31m"[0m[31m[0m]
    [1;34m104[0m:   corners = [[31m[1;31m"[0m[31m1[1;31m"[0m[31m[0m,[31m[1;31m"[0m[31m3[1;31m"[0m[31m[0m,[31m[1;31m"[0m[31m7[1;31m"[0m[31m[0m,[31m[1;31m"[0m[31m9[1;31m"[0m[31m[0m]
    [1;34m105[0m:   [1;34m#self = full game object - this is where I can start to build out basic AI[0m
    [1;34m106[0m:   [1;34m# 1 - Checks for center taken[0m
    [1;34m107[0m:   [32mif[0m [1;36mself[0m.board.cells[[1;34m4[0m] == [31m[1;31m"[0m[31m [1;31m"[0m[31m[0m
    [1;34m108[0m:     [31m[1;31m"[0m[31m5[1;31m"[0m[31m[0m
    [1;34m109[0m:   [32melse[0m
    [1;34m110[0m:     valid_moves.sample
    [1;34m111[0m:   [32mend[0m
    [1;34m112[0m: 
    [1;34m113[0m:   [1;34m# WIN_COMBINATIONS.find do |win_combination|[0m
    [1;34m114[0m:   [1;34m#   if self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X"[0m
    [1;34m115[0m:   [1;34m#     true[0m
    [1;34m116[0m:   [1;34m#   elsif self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O"[0m
    [1;34m117[0m:   [1;34m#     true[0m
    [1;34m118[0m:   [1;34m#   else[0m
    [1;34m119[0m:   [1;34m#     false[0m
    [1;34m120[0m:   [1;34m#   end[0m
    [1;34m121[0m:   [1;34m# end[0m
    [1;34m122[0m: [32mend[0m

