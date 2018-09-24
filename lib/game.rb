class Game

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]


  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?

    WIN_COMBINATIONS.any? do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  def draw?
     !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if !won?
      nil
    else
      WIN_COMBINATIONS.any? do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board.cells[win_index_1]
        position_2 = @board.cells[win_index_2]
        position_3 = @board.cells[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return "X"
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return "O"
        end
      end
    end
  end

  def turn
    pos = current_player.move(board)
    while board.valid_move?(pos) == false
      pos = current_player.move(board)
    end
    board.update(pos, current_player)

  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
