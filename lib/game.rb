class Game #Board and Player do not directly relate to the Game but do collaborate with each other through arguments.
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6],
   ]
   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @player_1 = player_1
     @player_2 = player_2
     @board = board
   end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def draw?
    board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
     if (board.cells[combination[0]] == "X" && board.cells[combination[1]] == "X" && board.cells[combination[2]] == "X") ||
        (board.cells[combination[0]] == "O" && board.cells[combination[1]] == "O" && board.cells[combination[2]] == "O")
         combination
      else
        false
    end
   end
  end

  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def start

  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

  def turn
    current_move = current_player.move(board)
    if !board.valid_move?(current_move)
      turn
    else
      board.display
      board.update(current_move, current_player)
      board.display
    end
  end





end
