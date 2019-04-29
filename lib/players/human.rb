require_relative '../player.rb'

class Human < Players


  def move(board)
    puts "Please enter 1-9:"
    input = gets.strip
  end
end
