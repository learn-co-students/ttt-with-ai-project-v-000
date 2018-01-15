module Players

class Human < Player
attr_accessor :token, :cells

  def move(input)
    input = gets.strip
  end


end
end
