class Players::Human < Player
  def move(board)
    puts "Where will you place your token?"
    input = gets.strip
    input
  end
end
