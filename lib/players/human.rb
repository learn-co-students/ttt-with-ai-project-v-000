module Players

class Human < Player
attr_accessor :token, :cells

  def move(position, token = "X")
    @cells[position] = token
  end


end
end
