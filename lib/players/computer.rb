module Players
  class Computer < Player


    def move(board)
      move = nil

      if win(board) != nil
        move = win(board)+1
      elsif block(board) != nil
        move = block(board)+1
      elsif center?(board)
        move = center?(board)
      else
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect {|i| !board.taken?(i)}

      end
    end

def win(board)
  possible_win = Game::WIN_COMBINATIONS.detect do |combo|
    board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.valid_move?(combo[2]+1) ||
    board.cells[combo[1]] == token && board.cells[combo[2]] == token && board.valid_move?(combo[0]+1) ||
    board.cells[combo[0]] == token && board.cells[combo[2]] == token && board.valid_move?(combo[1]+1)
  end
  if possible_win != nil
    move = possible_win.detect {|i| board.valid_move?(i+1)}
  end
end

def opponent
  if token == "X"
    return "O"
  elsif token == "O"
    return "X"
  end
end

def block(board)
  possible_block = Game::WIN_COMBINATIONS.detect do |combo|
    board.cells[combo[0]] == opponent && board.cells[combo[1]] == opponent && board.valid_move?(combo[2]+1) ||
    board.cells[combo[1]] == opponent && board.cells[combo[2]] == opponent && board.valid_move?(combo[0]+1) ||
    board.cells[combo[0]] == opponent && board.cells[combo[2]] == opponent && board.valid_move?(combo[1]+1)
  end
  if possible_block != nil
    move = possible_block.detect {|i| board.valid_move?(i+1)}
  end
end

def center?(board)
  if !board.taken?(5)
    move = "5"
  end
end
  end
end
