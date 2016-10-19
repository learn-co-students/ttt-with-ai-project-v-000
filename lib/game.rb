require "players/human.rb"

class Game

  include Players

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                       [0, 3, 6], [1, 4, 7], [2, 5, 8],
                       [0, 4, 8], [2, 4, 6] ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    @board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
       if combination.all? { |position| @board.cells[position] == "X" } ||
          combination.all? { |position| @board.cells[position] == "O" }
          return true
      end
    end
     return false
  end

  def draw?
    !self.won? && self.over?
  end

  def winner
    winner = nil
    WIN_COMBINATIONS.each do |combination|
       if combination.all? { |position| @board.cells[position] == "X" }
         winner = "X"
       end
       if combination.all? { |position| @board.cells[position] == "O" }
         winner = "O"
       end
     end
     winner
   end

   def turn
     move = 0
     while move == 0
       move = self.current_player.move(self.board).to_i
     end
     @board.cells[move - 1] = current_player.token
   end

end
