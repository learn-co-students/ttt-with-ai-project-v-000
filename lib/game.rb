require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :winning_token
  include Players

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #1st column
    [1,4,7], #2nd column
    [2,5,8], #third column
    [0,4,8], #1 diagonal
    [2,4,6] #2nd diagonal
  ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
    #   winning_token = ""
    #   won = true
    #   combo.each do |position|
    #     winning_token = @board.cells[combo[0]]
    #     if winning_token != "X" && winning_token != "O"
    #       won = false
    #     end
    #     if @board.cells[position] != winning_token
    #         won = false
    #     end
    #   end
    #   if won == true
    #     @winning_token = winning_token
    #     return true
    #   end
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        @winning_token = "X"
        puts "Congratulations X!"
        return true
      end
      if @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
        @winning_token = "O"
        puts "Congratulations O!"
        return true
      end
    end
    return false
  end

  def winner
    if won?
      return @winning_token
    end
    return nil
  end

  def start

  end

  def over?
    if won?
      true
    elsif draw?
      true
    else
      false
    end
  end

  def turn
    @board.update(current_player.move(@board), current_player)
  end

  def play
    until over?
      turn
      won?
      draw?
    end
  end

  def draw?
    if won?
      false
    elsif @board.full?
      puts "Cat's Game!"
      true
    else
      false
    end
  end


end
