# to call Human class, use namespace Players::Human

module Players
  class Human < Player
  
  
  def move(board)
    user_input = gets.strip until board.valid_move?(user_input) == true
    user_input
  end
  
  
  
  
  end
end
