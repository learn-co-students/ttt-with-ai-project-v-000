module Players

class Computer < Player

  def move(board)
    input = (1 + Random.rand(9)).to_s

    if board.valid_move?(input)
      puts "#{@token} has chosen: #{input}"
      board.update(input, self)
      input
    else
      move(board)
    end
  end

end

end
