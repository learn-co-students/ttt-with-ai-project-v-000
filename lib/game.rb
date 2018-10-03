require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Diagonal top-left to bottom-right
    [2,4,6] # Diagonal top-right to bottom-left
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if (@board.turn_count%2 == 0)
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |current_combo|
      position_1 = @board.cells[current_combo[0]]
      position_2 = @board.cells[current_combo[1]]
      position_3 = @board.cells[current_combo[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return current_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return current_combo
      else
        false
      end
    end
    return false
  end

  def draw?
    if @board.full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if @board.full? || won?
      return true
    else
      return false
    end
  end

  def winner
    winning_combo = won?
    if winning_combo == false || nil
      return nil
    else
      return @board.cells[winning_combo[0]]
    end
  end

  def turn
    square = current_player.move(@board)
    while !@board.valid_move?(square)
      puts "That is not a valid move, please try again: "
      square = current_player.move(@board)
    end
    @board.update(square, current_player)
    @board.display
    puts "\n\n"
    current_player
  end

  def play
    while !over? && !draw?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
