class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn
    input = current_player.move(@board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
     puts "Congratulations #{winner[0]}!"
    else
     puts "Cats Game!"
    end
   end

  def current_player
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def winner
    if won?
      won?
    else
      nil
    end
  end

  def over?
    won? || board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|

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
    else
      false
    end
  end
  false
  end

  def draw?
    !won? && board.full?
  end

end
