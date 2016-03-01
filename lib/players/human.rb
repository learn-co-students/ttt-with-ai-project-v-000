require 'pry'

class Player::Human < Player

  def move(board)
    puts "Please select a move"
   gets.strip
  end


end