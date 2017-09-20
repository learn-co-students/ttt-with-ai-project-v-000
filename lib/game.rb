class Game

   attr_accessor :board, :player_1, :player_2
   WIN_COMBINATIONS = [
     [0,1,2],[3,4,5],[6,7,8],[0,3,6],
     [1,4,7],[2,5,8],[0,4,8],[2,4,6]]
   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @board = board
     @player_1 = player_1
     @player_2 = player_2
   end

   def current_player
     self.board.turn_count.even?? self.player_1 : self.player_2
   end

   def last_player_turn
     self.board.turn_count.odd?? self.player_1 : self.player_2
   end

   def over?
     self.won? || self.draw?
   end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      self.board.cells[win_combination[0]] == self.board.cells[win_combination[1]] &&
      self.board.cells[win_combination[2]] == self.board.cells[win_combination[1]] &&
      (self.board.cells[win_combination[0]] == self.player_1.token || self.board.cells[win_combination[0]] == self.player_2.token)
    end
  end


  def draw?
    !self.won? & self.board.full?
  end

  def winner
    self.won?? self.board.cells[self.won?[0]] : nil
  end


  def turn

    move = self.current_player.move(self.board)

    if self.board.valid_move?(move)
      self.board.update(move, self.current_player)
    else
      puts "Invalid entry."
      self.turn
    end
  end

  def play

    until self.over?
      self.turn
      self.board.display
    end
    if self.won?

      self.board.display
      puts "Congratulations #{self.winner}!"
    else
      
      self.board.display
      puts "Cat's Game!"
    end
  end

end
