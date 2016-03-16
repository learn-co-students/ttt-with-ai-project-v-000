class Human < Player
  
  def move(board = nil)
    puts "What's your move?"
    gets.chomp
  end
end