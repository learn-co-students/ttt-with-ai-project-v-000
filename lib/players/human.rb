class Player::Human < Player

  attr_accessor :board, :cells
  attr_reader :token

  def move(board)
    token = self.token


    puts "What is your move Player #{token}?"
    move = gets.chomp
    return move

  end


end