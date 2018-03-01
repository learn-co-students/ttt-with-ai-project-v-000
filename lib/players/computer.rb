require 'pry'
class Computer < Player
  def move(board)
    if board.about_to_win?
      input = (board.about_to_win?[2] + 1).to_s
    elsif board.available_moves.include?("5") 
      input = "5"
    else
      input = board.available_moves.sample
    end
    input
  end
end