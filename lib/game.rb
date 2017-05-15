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

  attr_accessor :board
  attr_reader :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def player_1=(new_player)
    @player_1 = new_player
  end

  def player_2=(new_player)
    @player_2 = new_player
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    if won? != false || draw? == true || full? == true
      return true
    else
      return false
    end
  end

  def draw?
    x = won?
    y = full?
    if x == false && y == true
      true
    end
  end

  def full?
      @board.cells.none? do |value|
      value == " "
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

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
      end
    return false
  end

  def winner
    if won? != false
      indexes = won?
      token = @board.cells[indexes[0]]
      return token
    end
  end

  def turn
    puts "Please enter 1-9"
    input = current_player.move(@board)
    if !@board.valid_move?(input)
      turn
    else
      board.update(input, current_player)
      @board.display
    end

  end

  def play
    until over? == true
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
