module GameCheck
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    (won? || draw?) ? true : false
  end

  def draw?
    if board.full? == true && won? == false
      return true
    else 
      return false
    end
  end

  def won?
    @winner = WIN_COMBINATIONS.detect do |combo|
      (board.cells[combo[0]] == 'X' && board.cells[combo[1]] == 'X' && board.cells[combo[2]] == 'X') ||
      (board.cells[combo[0]] == 'O' && board.cells[combo[1]] == 'O' && board.cells[combo[2]] == 'O')
    end
    @winner ? true : false
  end

  def winner
    won? ? board.cells[@winner[0]] : nil
  end
end