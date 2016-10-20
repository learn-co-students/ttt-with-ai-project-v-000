#require "players/human.rb"

class Game

#  include Players

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

  def is_winner?(player)
    WIN_COMBINATIONS.each { |combination|
       if combination.all? { |position| @board.cells[position] == player }
         return true
       end }
     false
   end


  def won?
    is_winner?("X") || is_winner?("O")
  end

  def draw?
    !self.won? && self.over?
  end

  def winner
      is_winner?("X") && "X" || is_winner?("O") && "O" || nil
   end

   def turn
     move = self.current_player.move(@board)
     while !@board.valid_move?(move)
       puts "Invalid move, enter again:"
       move = self.current_player.move(@board)
     end
     @board.update(move.to_i, self.current_player)
   end

   def play
    while !self.over?
      self.turn
      if self.won?
        return self.winner
      end
    end
   end

end
