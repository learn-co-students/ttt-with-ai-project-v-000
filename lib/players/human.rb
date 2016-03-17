class Human < Player
  def move(board=nil)
    puts "What is your move?"
    move = gets.chomp
  end

end
