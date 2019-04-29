require_relative '../player.rb'

class Human < Players
  def move(board)
    puts "Please enter a number 1-9:"
    input = gets.strip
    #board.valid_move?(input)
  end
end
