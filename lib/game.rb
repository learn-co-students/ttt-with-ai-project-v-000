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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new) #what is going on here?
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
    # binding.pry
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?((combo[0]+1).to_s)
    end
  end


  def winner
    #binding.pry
    if won?
      @winner = @board.cells[won?.first]
    else
      nil
    end
  end

  def turn
    current_move = current_player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      puts "Turn: #{@board.turn_count+1}\n" #\n breaks a new line for the board to display underneath
      #@board.display
      puts "#{current_player.token} moved #{current_move}"
      @board.update(current_move, current_player)
      @board.display
      #binding.pry
      #current_player
    end
 end

 def play
   while !over?
     turn
   end
   if won?
     #binding.pry
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end

 def draw?
   @board.full? && !won?
 end

end
