
require_relative "../../config/environment.rb"

require 'pry'
class Computer < Player

  WIN_COMBOS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def move(board)
    if board_center_empty?(board)
      5.to_s
    #elsif check_board(board) != false
     # check_board(board)
    else
      rand(1..9).to_s
    end 
  end

  def board_center_empty?(board) #if the center square is blank, take it
    board.cells[4] == " " ? true : false
  end

  def check_board(board)
    WIN_COMBOS.each_with_index do |combo, index|
      if board.cells[combo[0]] != " " &&  board.cells[combo[1]] != " "
         
         return pick.to_s
      elsif board.cells[combo[1]] != " " &&  board.cells[combo[2]] != " "
         pick = index+1
         return pick.to_s
      elsif board.cells[combo[0]] != " " &&  board.cells[combo[2]] != " "
         pick = index+1
         return pick.to_s
      else
        return false
      end
    end
  end

  
end