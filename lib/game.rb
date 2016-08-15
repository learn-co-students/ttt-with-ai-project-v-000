class Game
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Top left bottom right diagonal
  [2,4,6]  # Top right bottom left diagonal
  ]
  attr_accessor :board, :player_1, :player_2, :winning_token
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
       @player_1
     else
       @player_2
     end
  end

  def won?
    no_winning_combo = "Y"
    count = 0
    while no_winning_combo == "Y" and count < 8
      winning_combo = WIN_COMBINATIONS[count]
      if (@board.cells[winning_combo[0]] == "X" and @board.cells[winning_combo[1]] == "X" and @board.cells[winning_combo[2]] == "X") or (@board.cells[winning_combo[0]] == "O" and @board.cells[winning_combo[1]] == "O" and @board.cells[winning_combo[2]] == "O")
        no_winning_combo = "N"
        @winning_token = @board.cells[winning_combo[0]]
      else
        count += 1
      end
    end
    if no_winning_combo == "N"
      true
    else
      false
    end
  end

  def full?
    @board.full?
  end

  def draw?
    !won? and full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      @winning_token
    else
      nil
    end
  end

  def turn
    player = current_player
    position = player.move(@board)
    if @board.valid_move?(position)
      @board.update(position, player)
      @board.display
    else
      turn
    end
  end

  def play
    while !over? do
      turn
    end
    if over?
      if draw?
        puts "Cats Game!"
      else
        token = winner
        puts "Congratulations #{token}!"
      end
    end
  end

end
