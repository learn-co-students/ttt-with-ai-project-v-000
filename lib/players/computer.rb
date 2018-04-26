require 'pry'
module Players
  class Computer < Player

    #WIN_COMBINATIONS = [
    #    [0,1,2], #<- Top-Row Win
    #    [3,4,5], #<- Middle-Row Win
    #    [6,7,8], #<- Bottom-Rown Win
    #    [0,3,6], #<- Left-Column Win
    #    [1,4,7], #<- Middle-Column Win
    #    [2,5,8], #<- Right-Column Win
    #    [0,4,8], #<- Left-Diagnal Win
    #    [6,4,2]] #<- Right-Diagnal Win

    def move(board)
        if board.cells[4] == " "
            "5"
            elsif board.cells[0] == " "
            "1"
            elsif board.cells[2] == " "
            "3"
            elsif board.cells[6] == " "
            "7"
            elsif board.cells[8] == " "
            "9"
            elsif board.cells[1] == " "
            "2"
            elsif board.cells[3] == " "
            "4"
            elsif board.cells[5] == " "
            "6"
            elsif board.cells[7] == " "
            "8"
        end
    end

  end
end

# AI: Possible unbeatable implimentation bellow in Comment
    #all_combos = WIN_COMBINATIONS.flatten
    #arr_win = all_combos.uniq.map!{|x| [x, all_combos.count(x)]}
    #moves_frequency = arr_win.sort_by{|key, value| value}.reverse.to_h
    #best_win = [4]
    #second_best = [8, 6, 2, 0]
    #least_best = [3,1,5,7]

    #if !board.taken?('4')
    #     best_win
    # end