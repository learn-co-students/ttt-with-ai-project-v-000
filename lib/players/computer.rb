require_relative '../board.rb'
require_relative '../game.rb'
class Player::Computer < Player
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  ARR = [5,1,3,8,2,9,7,6,4]
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

    if num != 10
      comp_num = (num + 1).to_s
    else
      comp_num = ARR.detect{|num| !board.taken?(num)}.to_s
    end
    return comp_num
  end
end
