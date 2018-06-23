require 'pry'
class Human < Player

    attr_accessor :board

  def move(board)
    @board = board
    puts "What would you like to enter"
    answer = gets.chomp
    answer
  end

end