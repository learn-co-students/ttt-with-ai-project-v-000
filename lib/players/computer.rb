class Player::Computer < Player
  attr_reader :token, :board
  def move(board)
    puts "Make your move!"
    comp_input = rand(9).to_s
  end
end