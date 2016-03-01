require 'pry'

class Human < Player

  def move(board)
    puts 'Please enter the number of the position you\'d like to play'
    return gets.strip
  end
end