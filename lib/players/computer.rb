module Players
  class Computer < Player
    attr_accessor :board

  def move(board)

      if winning_move(board) != nil
        winning_move(board)+1
      elsif block?(board) != nil
         block?(board)+1
       else
         center(board) || corners(board) || random_move(board)
       end
  end

  def corners(board)
    move = ["1", "3", "7", "9"].detect {|cell| !board.taken?(cell)}
  end

  def random_move(board)
    move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].detect {|cell| !board.taken?(cell)}
  end

  def winning_move(board)
    win_move = Game::WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.valid_move?(combo[2]+1) ||
      board.cells[combo[1]] == token && board.cells[combo[2]] == token && board.valid_move?(combo[0]+1) ||
      board.cells[combo[2]] == token && board.cells[combo[0]] == token && board.valid_move?(combo[1]+1)
    end

    if win_move
      move = win_move.detect {|cell| board.valid_move?(cell+1)}
    end
  end

  def block?(board)
      block_move = Game::WIN_COMBINATIONS.detect do |combo|
        board.cells[combo[0]] == opponent && board.cells[combo[1]] == opponent && board.valid_move?(combo[2]+1) ||
        board.cells[combo[1]] == opponent && board.cells[combo[2]] == opponent && board.valid_move?(combo[0]+1) ||
        board.cells[combo[2]] == opponent && board.cells[combo[0]] == opponent && board.valid_move?(combo[1]+1)
      end

      if block_move
        move = block_move.detect {|cell| board.valid_move?(cell+1)}

    end
  end

  def center(board)
    if !board.taken?("5")
      move = "5"
    end
  end

  def opponent
    if token == "X"
      "O"
    else
      "X"
    end
  end



  end
end
