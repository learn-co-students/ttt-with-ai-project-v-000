class Human < Player
  def move(game_board)
    puts "What move do you want to make? Enter 1 through 9:"
    gets.strip
  end
end
