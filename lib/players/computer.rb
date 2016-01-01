require_relative '../player.rb'
require_relative '../board.rb'
require_relative '../game.rb'

class Computer < Player

  def move(token, board)
    sleep(1/16.to_f)
    
    if board.almost_won?
      board.almost_won?.each do |i|
        if board.cells[i] == " "
          return i + 1
        end
      end
    elsif board.turn_count == 0
      return cpu_move = [1,3,5,7,9].sample.to_s
    elsif board.turn_count == 1 && board.taken?(5)
      return cpu_move = [1,3,7,9].sample.to_s
    elsif board.turn_count == 1 && !board.taken?(5)
      return cpu_move = 5
    end
    cpu_move = (1..9).to_a.sample.to_s
  end

end