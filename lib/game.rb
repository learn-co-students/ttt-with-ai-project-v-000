require 'pry'

class Game

attr_accessor :player_1, :player_2, :board, :the_winner

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left
    [1,4,7], # Middle
    [2,5,8], #Right
    [0,4,8], #L Diag
    [2,4,6]  #R Diag
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
      @the_winner=""
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    # winning_combo = nil
    # WIN_COMBINATIONS.each do |combo|
    #   if combo.all? do |pos|
    #     @board.position(pos+1) == "X"
    #     end
    #     winning_combo = combo
    #   elsif combo.all? do |pos|
    #       @board.position(pos+1) == "O"
    #     end
    #     winning_combo = combo
    #   else
    #     next
    #   end #end if
    # end #Match all winning combos to the current board
    # winning_combo
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

  def draw?
    if @board.full? && won? == nil
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    # if won?
    #   winning_combo = won?
    #   return @board.position(winning_combo[0]+1)
    # else
    #   nil
    # end
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end #winner

  def turn
    puts "Please enter 1-9:"
    desired_move = current_player.move(@board)
    if @board.valid_move?(desired_move)
      puts desired_move
      @board.update(desired_move, current_player)
    else
      puts "invalid"
      turn
    end
  end #turn

  def play
    until over? == true do
      turn
      @board.display
    end
    if won?
      puts "Congratulations #{winner}!"
      return winner
    elsif draw?
      puts "Cat's Game!"
    end
  end

end #class
