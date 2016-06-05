class Player::Computer < Player
  def move(board)
    input = (1..9).to_a.sample
    until board.taken?(input) == false
      input = (1..9).to_a.sample
    end
    puts "It's now the computer's turn."
    input.to_s
  end
end
