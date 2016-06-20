require 'pry'

#ideas: make computer find a 3 space line in which it has a token and the other 2 spaces are empty. will build a win.

class Player::Computer < Player

  def move(board)
    first_move(board) ||
    finisher(board, token) ||
    saver(board, token) ||
    optimal(board)
  end

  def first_move(board)
    if !board.taken?(5)
      "5"
    end
  end

  def go_for_the_kill(board, token)
    Game::WIN_COMBINATIONS.detect do |win|
      (board.cells[win[0]] == token && board.cells[win[1]] == token && !board.taken?(win[2]+1)) ||
      (board.cells[win[0]] == token && board.cells[win[2]] == token && !board.taken?(win[1]+1)) ||
      (board.cells[win[1]] == token && board.cells[win[2]] == token && !board.taken?(win[0]+1))
    end
  end

  def finisher(board, token)
    if go_for_the_kill(board, token)
      execute = go_for_the_kill(board, token)
      walk_off_home_run = execute.detect do |x|
        !board.taken?(x+1)
      end
      walk_off_home_run+1
    end
  end

  def get_back_up(board, token)
    Game::WIN_COMBINATIONS.detect do |win|
      ((board.cells[win[0]] != token && board.taken?(win[0]+1)) && (board.cells[win[1]] != token && board.taken?(win[1]+1))&& !board.taken?(win[2]+1)) ||
      ((board.cells[win[0]] != token && board.taken?(win[0]+1)) && (board.cells[win[2]] != token && board.taken?(win[2]+1))&& !board.taken?(win[1]+1)) ||
      ((board.cells[win[1]] != token && board.taken?(win[1]+1)) && (board.cells[win[2]] != token && board.taken?(win[2]+1))&& !board.taken?(win[0]+1))
    end
  end

  def saver(board, token)
    if get_back_up(board, token)
      execute = get_back_up(board, token)
      walk_off = execute.detect do |x|
        !board.taken?(x+1)
      end
      walk_off+1
    end
  end

  def optimal(board)
    array = [1,3,7,9]
    if !array.all?{|m| board.taken?(m)}
      array.sample
    else
      rand(1..9)
    end
  end
end
