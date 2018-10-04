module Players
  class Human < Player
  
  def move(board)
    puts "Please enter a move:"
    input = gets.strip
  end
  
  end
end