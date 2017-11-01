class Game

  attr_accessor :board, :player_1, :player_2, :human, :player, :board

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

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    counter = 0
    board.cells.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    if counter % 2 == 0
      return player_1
    else
      return player_2
    end
  end

  def over?
     board.cells.all? do |space|
      space == "X" || space == "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = @board.cells[win_index_1]
       position_2 = @board.cells[win_index_2]
       position_3 = @board.cells[win_index_3]

       if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O"  && position_3 == "O"
       return win_combination
      end
    end
    false
  end

  def draw?
    if over? && !won?
      return true
    else
      return false
    end
  end

  def winner
    if !won?
      return nil
    elsif @board.cells[won?[0]] == "X"
      return "X"
    else
      return "O"
    end
  end

  def turn
    input = @player_1.move(board)
    until @board.valid_move?(input)
      input = @player_1.move(board)
    end
  end

end
