require_relative '../board.rb'
require_relative '../game.rb'
class Player::Computer < Player
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def move(board)
    comp_num = ""
    num = 10
    WIN_COMBINATIONS.each do |combo|
      num = combo[2] if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && !board.taken?(combo[2] + 1)
      num = combo[0] if board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X" && !board.taken?(combo[0] + 1)
      num = combo[1] if board.cells[combo[0]] == "X" && board.cells[combo[2]] == "X" && !board.taken?(combo[1] + 1)
      num = combo[2] if board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && !board.taken?(combo[2] + 1)
      num = combo[0] if board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O" && !board.taken?(combo[0] + 1)
      num = combo[1] if board.cells[combo[0]] == "O" && board.cells[combo[2]] == "O" && !board.taken?(combo[1] + 1)
    end
    #binding.pry
    if num != 10
      comp_num = (num + 1).to_s
    elsif !board.taken?(5)
      comp_num = "5"
    elsif !board.taken?(1)
      comp_num = "1"
    elsif !board.taken?(3)
      comp_num = "3"
    elsif !board.taken?(7)
      comp_num = "7"
    elsif !board.taken?(9)
      comp_num = "9"
    elsif !board.taken?(2)
      comp_num = "2"
    elsif !board.taken?(8)
      comp_num = "8"
    elsif !board.taken?(6)
      comp_num = "6"
    else
      comp_num = "4"
    end
    return comp_num
  end
end
