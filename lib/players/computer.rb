require 'pry'
module Players
  class Computer < Player#board

    #board => [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    #board.cells => [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    #board.cells[0..8] => [" ", " ", " ", " ", " ", " ", " ", " ", " "]

    def move(board)
    #board.cells[4] => " "
      if !board.taken?("5")
        "5"
      elsif !board.taken?("1")
        "1"
      elsif !board.taken?("3")
        "3"
      elsif !board.taken?("7")
        "7"
      elsif !board.taken?("9")
        "9"
      elsif !board.taken?("2")
        "2"
      elsif !board.taken?("4")
        "4"
      elsif !board.taken?("6")
        "6"
      else !board.taken?("8")
        "8"
      end

    end
  end
end

     #return 0 if board.draw?
     #return -1 if board.over?

     #board.available_spaces.each do |space|
       #board.test_update(space, board.current_player)
       # binding.pry
       #best_score[space] = -1 * move(board, depth + 1, {})
       #board.reset_space_at(space)
     #end

     #best_move = best_score.max_by { |key, value| value }[0]
     #highest_minimax_score = best_score.max_by { |key, value| value }[1]

     #if depth == 0
       # binding.pry
       #return best_move
     #elsif depth > 0
       #return highest_minimax_score
     #end
   #end

   #if board.cells[4] == " "
     #move.board.token.cells[4]
     #update.board

   #elsif board.cells[0] == " "
     #move.board.token.cells[0]
     #update.board

   #elsif board.cells[2] == " "
     #move.board.token.cells[2]
     #update.board

   #elsif board.cells[6] == " "
     #move.board.token.cells[6]
     #update.board

   #elsif board.cells[8] == " "
     #move.board.token.cells[8]
     #update.board

   #elsif board.cells[1] == " "
     #move.board.token.cells[1]
     #update.board

   #elsif board.cells[3] == " "
     #move.board.token.cells[3]
     #update.board

   #elsif board.cells[5] == " "
     #move.board.token.cells[5]
     #update.board

   #elsif board.cells[7] == " "
     #move.board.token.cells[7]
     #update.board
