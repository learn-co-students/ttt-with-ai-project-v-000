require 'spec_helper'

class Game

  attr_accessor :board, :player_1, :player_2, :winner

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6] ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
     board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.each do |combination|   #[0,1,2] which is board range (0-8)
        if @board.cells[combination[0]] == @board.cells[combination[1]] &&
          @board.cells[combination[1]] == @board.cells[combination[2]] &&
          @board.taken?(combination[0]+1)
          #Need to +1, because #taken? rspec test is working off user_input range (1-9)
          return combination
        end
      end
    return false
  end

  def draw?
    @board.full? && !won? ? true : false
  end

  def over?
     !@board.full? ? false : true
     # IF board is not full, game is in progress (FALSE), ELSE, game is over (TRUE)
  end

  def winner
    if won?
      combination = won?
      @board.cells[combination[0]] # X or O
    end
  end


end
