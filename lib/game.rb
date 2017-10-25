# require './lib/player.rb'

class Game
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

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board= Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player #returns whose turn it is, player_1 or player_2
    if @board.turn_count.even?
      return @player_1
    else
      return @player_2
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def won?  #returns false for a draw or in progress, winning combination otherwise
    WIN_COMBINATIONS.each do |win_array|
      win_index_0 = win_array[0]
      win_index_1 = win_array[1]
      win_index_2 = win_array[2]

      value_at_win_index_0 = @board.cells[win_index_0]
      value_at_win_index_1 = @board.cells[win_index_1]
      value_at_win_index_2 = @board.cells[win_index_2]

      if value_at_win_index_0 == "X" && value_at_win_index_1 == "X" && value_at_win_index_2 == "X"
        return win_array
      elsif value_at_win_index_0 == "O" && value_at_win_index_1 == "O" && value_at_win_index_2 == "O"
        return win_array
      end
    end
    false
  end

  def draw? #true for a draw, false otherwise
    if won?
      return false
    else
      if @board.full?
        return true
      else
        return false
      end
    end
  end

  def winner #returns winner, X or O or nil
    win_array = won?
    if !win_array
      return nil
    end

    if @board.cells[win_array[0]] == "X"
      return "X"
    elsif @board.cells[win_array[0]] == "O"
      return "O"
    end
  end

  def turn
    move = current_player.move(@board)
    if @board.valid_move?(move)
      @board.update(move, current_player)
      @board.display
    else
      puts "invalid"
      turn
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

# computer_player = Players::Computer.new("O")
# human_player = Players::Human.new("X")
# new_game = Game.new#(human_player, computer_player)
# new_game.play
