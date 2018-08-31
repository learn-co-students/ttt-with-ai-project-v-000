class Players::Human < Player
  def move(board)
    "Where will you place your token?"
    input = gets.strip
    input
  end
end
