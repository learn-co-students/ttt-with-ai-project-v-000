require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  #returns current player
  def current_player
    if board.turn_count.odd?
      @token = @player_2
    else
      @token = @player_1
    end
  end

  def over?
    won = nil
    #checks to see if there's a win for either player
    WIN_COMBINATIONS.each do |win_combo|
      if (@board.cells[win_combo[0]] && @board.cells[win_combo[1]] && @board.cells[win_combo[2]] == 'X') || (@board.cells[win_combo[0]] && @board.cells[win_combo[1]] && @board.cells[win_combo[2]] == 'O')
        won = true
      else
        won = false
      end
    end
      ## smelly code... not all the checks are working properly here.
      if board.turn_count < 9
        return false
      elsif won == true
        return true
      elsif board.full?
        return true
      end
  end

end
