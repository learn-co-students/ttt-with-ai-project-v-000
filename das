
[1mFrom:[0m /home/yujunsung-28811/code/labs/ttt-with-ai-project-v-001/lib/game.rb @ line 64 Game#won?:

    [1;34m37[0m: [32mdef[0m [1;34mwon?[0m
    [1;34m38[0m:   flag = [1;36mfalse[0m
    [1;34m39[0m: 
    [1;34m40[0m:   [32mif[0m @board.turn_count > [1;34m4[0m
    [1;34m41[0m:       [1;34;4mWIN_COMBINATIONS[0m.each [32mdo[0m |combi|
    [1;34m42[0m:         x_count = [1;34m0[0m
    [1;34m43[0m:         o_count = [1;34m0[0m
    [1;34m44[0m:         combi.each [32mdo[0m |num|
    [1;34m45[0m: 
    [1;34m46[0m:           [32mif[0m @board.cells[num] == [31m[1;31m"[0m[31mX[1;31m"[0m[31m[0m
    [1;34m47[0m:             x_count = x_count + [1;34m1[0m
    [1;34m48[0m:             [32mif[0m x_count == [1;34m3[0m
    [1;34m49[0m:                flag = [1;36mtrue[0m
    [1;34m50[0m:                @winner = [31m[1;31m"[0m[31mX[1;31m"[0m[31m[0m
    [1;34m51[0m:             [32mend[0m
    [1;34m52[0m:           [32melsif[0m @board.cells[num] == [31m[1;31m"[0m[31mO[1;31m"[0m[31m[0m
    [1;34m53[0m:             o_count = o_count + [1;34m1[0m
    [1;34m54[0m:             [32mif[0m o_count == [1;34m3[0m
    [1;34m55[0m:               flag = [1;36mtrue[0m
    [1;34m56[0m:               @winner = [31m[1;31m"[0m[31mO[1;31m"[0m[31m[0m
    [1;34m57[0m:             [32mend[0m
    [1;34m58[0m:           [32mend[0m [1;34m#if board.cells[0m
    [1;34m59[0m:         [32mend[0m[1;34m#combi[0m
    [1;34m60[0m:       [32mend[0m [1;34m#WIN_COM[0m
    [1;34m61[0m:     [32mend[0m [1;34m#if >5[0m
    [1;34m62[0m: 
    [1;34m63[0m:     flag
 => [1;34m64[0m:     binding.pry
    [1;34m65[0m: [32mend[0m [1;34m#won?[0m

