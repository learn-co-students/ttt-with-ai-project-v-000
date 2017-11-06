class Players::Human < Player

  def move(board)
    puts "Player, Please enter 1-9:"
    input = gets.chomp
  end

end
