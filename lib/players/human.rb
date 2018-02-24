module Players
  class Human < Player
  
  def move(board = nil)
    puts "You're up! Where would you like to move? Please pick a valid position from 1-9."
    gets.strip
  end
  
  end
end