require_relative '../player.rb'

class Human < Player

  def move(token, board)
    puts "Where would you like to move?"
    move = gets.chomp
    move
  end




end