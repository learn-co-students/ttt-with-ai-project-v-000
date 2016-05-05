require_relative "../../config/environment.rb"

class Human < Player
  def move(board)
    input = gets.chomp
  end
end