module Players

class Human < Player
attr_accessor :token, :cells

  def initialize
    @token = token
  end


  def move(input)
    puts "Please select a position 1-9."
    gets.strip
  end


end
end
