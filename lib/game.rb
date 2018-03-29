require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #top row horizontal, WIN_COMBINATIONS[0] IN OTHER WORDS THIS IS THE SAME AS COMBO[0]
    [3,4,5], #middle row horizontal COMBO[0] == 3
    [6,7,8], #bottom row horizontal
    [0,3,6], #left-side vertical
    [1,4,7], #middle vertical
    [2,5,8], #right-side vertical
    [2,4,6], #diagonal win 1
    [0,4,8], #diagonal win 2
  ]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    @board = board || Board.new
    #binding.pry
  end

  def current_player
    if @board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end


  def won?
    WIN_COMBINATIONS.find do |combo|
     if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
       true
     elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
       true
     else
       false
     end
   end
 end

  def draw?
    if @board.full? && !won?
      true
    end
  end

  def over?
    if draw?
      true
    elsif won?
      true
    end
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
  player = current_player
  potential_move = player.move(@board)
    if !@board.valid_move?(potential_move)
      turn
    elsif @board.valid_move?(potential_move)
     @board.update(potential_move, player)
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end 
  end



end
