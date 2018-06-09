class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1;
    @player_2 = player_2;
    @board = board;
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # First column
    [1, 4, 7], # Second column
    [2, 5, 8], # Third Column
    [0, 4, 8], # Left to Right diagonal
    [2, 4, 6]  # Right to Left diagonal
  ];

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2;
  end

  def won?
    x = "X";
    o = "O";

    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0];
      win_index_2 = win_combination[1];
      win_index_3 = win_combination[2];

      position_1 = @board.cells[win_index_1];
      position_2 = @board.cells[win_index_2];
      position_3 = @board.cells[win_index_3];

      if ((position_1 == x && position_2 == x && position_3 == x) ||
        (position_1 == o && position_2 == o && position_3 == o))
          return win_combination;
        else
          false
      end
    end
    false; #explicitly tell ruby to return false if we've cycled through the board and no win combinations can be found
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    winner = won?
    won? == false ? nil : @board.cells[winner[0]]
  end

  def turn
    puts "Please enter 1-9:"
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, current_player)
      @board.display
    else
      turn
    end
  end

  def play
    until over? do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
