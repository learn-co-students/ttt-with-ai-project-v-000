
[1mFrom:[0m /home/saurookadook/ttt-with-ai-project-v-000/lib/players/computer.rb @ line 16 Players::Computer#move:

    [1;34m15[0m: [32mdef[0m [1;34mmove[0m(board)
 => [1;34m16[0m:   binding.pry
    [1;34m17[0m:   blocking_move = []
    [1;34m18[0m:   [1;34;4mWIN_COMBINATIONS[0m.each [32mdo[0m |win_combo|
    [1;34m19[0m:     [32mif[0m (board.cells[win_combo[[1;34m0[0m]] == [31m[1;31m"[0m[31mX[1;31m"[0m[31m[0m && board.cells[win_combo[[1;34m1[0m]] == [31m[1;31m"[0m[31mX[1;31m"[0m[31m[0m) || (board.cells[win_combo[[1;34m0[0m]] == [31m[1;31m"[0m[31mO[1;31m"[0m[31m[0m && board.cells[win_combo[[1;34m1[0m]] == [31m[1;31m"[0m[31mO[1;31m"[0m[31m[0m)
    [1;34m20[0m:       blocking_move << win_combo[[1;34m2[0m].to_s
    [1;34m21[0m:     [32melsif[0m (board.cells[win_combo[[1;34m0[0m]] == [31m[1;31m"[0m[31mX[1;31m"[0m[31m[0m && board.cells[win_combo[[1;34m2[0m]] == [31m[1;31m"[0m[31mX[1;31m"[0m[31m[0m) || (board.cells[win_combo[[1;34m0[0m]] == [31m[1;31m"[0m[31mO[1;31m"[0m[31m[0m && board.cells[win_combo[[1;34m2[0m]] == [31m[1;31m"[0m[31mO[1;31m"[0m[31m[0m)
    [1;34m22[0m:       blocking_move << win_combo[[1;34m1[0m].to_s
    [1;34m23[0m:     [32melsif[0m (board.cells[win_combo[[1;34m1[0m]] == [31m[1;31m"[0m[31mX[1;31m"[0m[31m[0m && board.cells[win_combo[[1;34m2[0m]] == [31m[1;31m"[0m[31mX[1;31m"[0m[31m[0m) || (board.cells[win_combo[[1;34m1[0m]] == [31m[1;31m"[0m[31mO[1;31m"[0m[31m[0m && board.cells[win_combo[[1;34m2[0m]] == [31m[1;31m"[0m[31mO[1;31m"[0m[31m[0m)
    [1;34m24[0m:       blocking_move << win_combo[[1;34m0[0m].to_s
    [1;34m25[0m:     [32mend[0m
    [1;34m26[0m:   [32mend[0m
    [1;34m27[0m:   blocking_move[[1;34m0[0m]
    [1;34m28[0m: 
    [1;34m29[0m:   input = ([1;34;4mRandom[0m.new.rand([1;34m9[0m)).to_s
    [1;34m30[0m:   [32mif[0m board.valid_move?(input)
    [1;34m31[0m:     input
    [1;34m32[0m:   [32melse[0m
    [1;34m33[0m:     move(board)
    [1;34m34[0m:   [32mend[0m
    [1;34m35[0m: [32mend[0m

