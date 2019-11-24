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
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
      if won = won?
        board.cells[won.first]
      end
   end

   def turn
     move = current_player.move(@board)
     while !@board.valid_move?(move)
       if current_player.is_a? Players::Human
         puts "Invalid move! enter again:"
       end
       move = current_player.move(@board)
     end
     @board.update(move.to_i, current_player)
   end

   def play
    while !over?
      puts @board.display
      turn
    end
    puts @board.display
    won? ? puts("Congratulations #{winner}!") : puts("Cats Game!")
   end

end
