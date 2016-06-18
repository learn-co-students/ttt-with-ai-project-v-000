class Player
  attr_reader :token

  def initialize(token = "X")
    @token = token
  end
end

class Human < Player
  def move(board)
    puts "Please enter 1-9:"
    input = gets.chomp
    input
  end
end
