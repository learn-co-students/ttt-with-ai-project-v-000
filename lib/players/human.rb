class Human < Player

  def move(board)
    puts "#{self.token}, please choose a square to play."
    input = gets.strip
    if board.valid_move?(input)
      board = board.moves.find {|board| board.cells[input.to_i - 1] == self.token }
    else
      puts "Sorry, that's not a valid move! Try again."
      move(board)
    end
  end
end
