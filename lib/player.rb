
class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end

class Human < Player

  def move(token)
    puts "please select a space:\n"
    gets.rstrip
  end

end