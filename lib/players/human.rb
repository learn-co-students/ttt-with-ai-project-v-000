class Player::Human < Player 

  attr_accessor :board

  def move(board)
    puts "where on the board would you like to go? Choose a number from 1-9"
    input = gets.strip
  end 



end 


  # board.update(input, player.token)