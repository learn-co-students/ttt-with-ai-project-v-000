require 'pry'
class Player::Human < Player

  def move(board)
     puts "Enter input:"
     input = gets.strip
   # binding.pry
   # @board.cells[input.to_i-1] = self

  end
end