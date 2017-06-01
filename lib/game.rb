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
    WIN_COMBINATIONS.each do |combination|   #[0,1,2]
        if @board.cells[combination[0]] == @board.cells[combination[1]] &&
          @board.cells[combination[1]] == @board.cells[combination[2]] &&
          @board.taken?(combination[0])

          @winner = @board.cells[combination[0]]
          return true # Checking for winner X or O
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

  ## COME BACK FOR THIS
  def winner
    if won?
      @winner
    elsif !over?
      nil
    end
  end

  # ask for input after failed validation
  # make valid move
  # change to player 2 after first turn
  def turn
    puts "Where will you like to put your token?"
    position = player_1.gets
  end

end
