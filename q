
[1mFrom:[0m /home/zacwillmington/ttt-with-ai-project-v-000/lib/players/computer.rb @ line 32 Players::Computer#quickest_win_combo:

    [1;34m20[0m: [32mdef[0m [1;34mquickest_win_combo[0m(board, win_combos)
    [1;34m21[0m:     places_of_tokens = board.cells.each_index.select [32mdo[0m|i|
    [1;34m22[0m:         board.cells[i] == [1;36mself[0m.token
    [1;34m23[0m:     [32mend[0m
    [1;34m24[0m: 
    [1;34m25[0m:     @places_of_tokens = places_of_tokens
    [1;34m26[0m: 
    [1;34m27[0m:         win_combo_match = win_combos.find_all [32mdo[0m |combos|
    [1;34m28[0m:             places_of_tokens.any? [32mdo[0m |elements|
    [1;34m29[0m:                 elements == combos[[1;34m0[0m] || elements == combos[[1;34m1[0m] || elements == combos[[1;34m2[0m]
    [1;34m30[0m:             [32mend[0m
    [1;34m31[0m:         [32mend[0m
 => [1;34m32[0m:         binding.pry
    [1;34m33[0m:             [1;34m# it freezes, It has no where to go. add else[0m
    [1;34m34[0m:             [1;34m#could be in winning_square statment that takes next closest[0m
    [1;34m35[0m:         combos_most_tokens = win_combo_match.find [32mdo[0m |best_combo|
    [1;34m36[0m:             best_combo.include?(places_of_tokens[[1;34m0[0m] && places_of_tokens[[1;34m1[0m])
    [1;34m37[0m:             [1;34m# var = best_combo - (@places_of_tokens[0]..@places_of_tokens[1]).to_a[0m
    [1;34m38[0m:             [1;34m# var[0m
    [1;34m39[0m:         [32mend[0m
    [1;34m40[0m:         combos_most_tokens
    [1;34m41[0m: [32mend[0m

