class Human < Player

  def move(board)
    puts "Your turn #{self.token}! Choose a cell number (1-9):"
    input = gets.strip
  end
  
end
