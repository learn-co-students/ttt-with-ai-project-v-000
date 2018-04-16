module Players

class Human < Player

  def move(board)
    print "#{@token} choose a position: "
    input = gets.strip

    if board.valid_move?(input)
      board.update(input, self)
      input
    else
      move(board)
    end
  end
end

end
