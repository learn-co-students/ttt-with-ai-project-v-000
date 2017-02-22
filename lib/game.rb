require 'pry'

class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [6,4,2]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  def current_player

    if @board.turn_count.odd?
      return @player_2
    else
      return @player_1
    end

  end
  def over?
    if @board.full?
      return true
    end
    WIN_COMBINATIONS.each do |combo|
      if @board.cells.include?(combo)
        @winning_combo = combo
        return true
      else
        return false
      end
    end
  end

  def won?
    if WIN_COMBINATIONS.each do |win_combination|

      @position_1 = @board.cells[win_combination[0]]
      @position_2 = @board.cells[win_combination[1]]
      @position_3 = @board.cells[win_combination[2]]

        if @position_1 == "X" && @position_2 == "X" && @position_3 == "X"
          return true
        elsif @position_1 == "O" && @position_2 == "O" && @position_3 =="O"
          return true
        end
    end
    else
      false
    end
  end
  def draw?
    if over?
      unless won?
        return true
      end
    end
  end
  def winner
    if won?
      return @position_1
    end
  end
  def turn
    puts "Please enter 1-9:"
    number = gets
    


  end


end
