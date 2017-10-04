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
  [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.detect do |winc|
      @board.cells[winc[0]] == @board.cells[winc[1]] &&
      @board.cells[winc[1]] == @board.cells[winc[2]] &&
      (@board.cells[winc[0]]  == "X" || @board.cells[winc[0]] == "O")
    end
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    if winc = won?
      @winner = @board.cells[winc[0]]
    end
  end

  def turn
   player = current_player
   input = player.move(@board)
   if !@board.valid_move?(input)
     turn
   else
     puts "Turn: #{@board.turn_count + 1}"
     @board.update(input, player)
     puts "#{player.token} moved #{input}"
     @board.display
   end
 end

 def play
   until over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end

end
