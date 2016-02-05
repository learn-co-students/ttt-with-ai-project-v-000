require 'pry'

class Game
  attr_accessor:board,:player_1,:player_2

  WIN_COMBINATIONS = [
 [0,1,2], [3,4,5], [6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(player_1=Player::Human.new("X"),player_2=Player::Human.new("O"),board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
     self.board.cells[combo[0]] == self.board.cells[combo[1]] &&
     self.board.cells[combo[1]] == self.board.cells[combo[2]] &&
     board.taken?(combo[0]+1)
    end
  end


  def draw?
    self.board.full? && !self.won?   
  end

  def over?
  self.draw? || self.won? 
  end

  def winner
    if winning_combo = self.won?
    @winner = board.cells[winning_combo.first]
    end
  end

  def turn
    move =current_player.move(board)
      if !board.valid_move?(move)
           self.turn
      else
        board.update(move,current_player)
        self.board.display
      end
  end
  

  def play
    until over?
    print "#{current_player.token}'s turn."
    self.turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
  end

  
end
