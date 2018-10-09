require 'pry'
require 'spec_helper'

class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turns = @board.turn_count
    if turns % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?

    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]


        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combo
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combo
        end
      end
      return false
    end

  def draw?
    if @board.full? == true && self.won? == false
      return true
    else
      return false
    end
  end

  def over?
    if self.draw? == true
      return true
    elsif self.won? != false
      return true
    elsif @board.full? == true
      return true
    elsif self.won? == true && @board.full? == false
      return true
    else
      return false
    end
  end

  def winner
    if self.won? == false
      return nil
    else
      winning_array = self.won?
      index = winning_array[0]
      if @board.cells[winning_array[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

  def turn

    @board.display
    input1 = @player_1.move(@board)

    while @board.valid_move?(input1) == false
      input1 = @player_1.move(@board)
    end

    @board.display
    input2 = @player_2.move(@board)

    while @board.valid_move?(input2) == false
      input2 = @player_2.move(@board)
    end

  end


  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]

end
