require_relative '../player.rb'

class Human < Player

  def move(board)
    gets.chomp
  end


end