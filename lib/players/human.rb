module Players

class Human < Player

  def move(board)
    puts "please enter input"
    input = gets.strip
    return input
  end

end

end
