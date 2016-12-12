class Player::Human < Player
  def move(board=nil)
    puts "Hello, Player #{token}, what is your move(1-9)?"
    move = gets.chomp
  end

end
