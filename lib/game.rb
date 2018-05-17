require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count.even?
      @player_1
    elsif self.board.turn_count.odd?
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
     index_1 = win_combination[0]
     index_2 = win_combination[1]
     index_3 = win_combination[2]

     position_1 = board.cells[index_1]
     position_2 = board.cells[index_2]
     position_3 = board.cells[index_3]

    position_1 == position_2 && position_2 == position_3 && board.taken?(index_1 + 1)
    end
  end

   def full?
     @board.cells.all? {|space| space == "X" || space == "O"}
   end

   def draw?
     if self.full? && self.won?
       false
     elsif !self.full?
       false
     else
       true
     end
   end

   def over?
     if self.draw?
       true
     elsif self.won?
       true
     else
       false
     end
   end

   def winner
     if self.won?
        winner = self.won?
        self.board.cells[winner[0]]
     else
       nil
     end
    end

    def turn
      player = current_player
      input = player.move(@board)
      self.board.update(input,player) ? self.board.update(input,player) : input = player.move(@board)
    end

    def play
      while !over?
       turn
      end
        if won?
          puts "Congratulations #{self.winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end

end
