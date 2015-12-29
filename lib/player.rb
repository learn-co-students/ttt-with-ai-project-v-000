
class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end

class Human < Player

  def move(board)
    puts "please select a space:\n"
    gets.rstrip
  end

end