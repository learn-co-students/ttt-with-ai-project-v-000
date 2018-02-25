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
      [6,4,2]
    ]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @board = board
     @player_1 = player_1
     @player_2 = player_2
   end

  def current_player
   @board.turn_count % 2 == 0 ? player_1 : player_2
 end

 def over?
  draw? || won? != nil
 end

  def won?
   WIN_COMBINATIONS.detect do |win|
    if win.all?{|i| board.cells[i] == "X"}
      win
    elsif win.all?{|i| board.cells[i] == "O"}
      win
    else
     false
     #board.cells[win[0]] == @board.cells[win[1]] && @board.cells[win[1]] == @board.cells[win[2]]
    end
   end
  end

  def draw?
   board.full? && !won?
 end

  def winner
    if won?
     @board.cells[won?[0]]
   else
     nil
   end
 end

  def turn
    loop do
      input = current_player.move(board)
      if board.valid_move?(input)
      board.update(input, current_player)
      break
      else
        "invalid"
      end
    end
  end

  def play
      until over? || draw? do
        turn
      @board.cells
    end
    if over? && won? != nil
      puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
  end

end
