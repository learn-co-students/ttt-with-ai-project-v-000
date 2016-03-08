require_relative 'board.rb'
require_relative 'players/human.rb'
require_relative 'players/computer.rb'
class Game
  WIN_COMBINATIONS=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=nil, player_2=nil, board=nil)
      board = Board.new if !board
      player_1 = Human.new("X") if !player_1
      player_2 = Human.new("O") if !player_2
      
      @board = board if board
      @player_1 = player_1 if player_1
      @player_2 = player_2 if player_2
  end

  def current_player
    if (@board.turn_count % 2) == 0
      @player_1
    else
      @player_2
    end
  end
  
  def over?

  end

  def won?
    won=false
    WIN_COMBINATIONS.each do |arr|
        if @board.cells[arr[0]] == "X" && @board.cells[arr[1]] == "X" && @board.cells[arr[2]] == "X" ||
            @board.cells[arr[0]] == "O" && @board.cells[arr[1]] == "O" && @board.cells[arr[2]] == "O"
          won = true # return the win_combination indexes that won.
        end
    end
    won
  end

  def draw?
    full=board.cells.all? do |space|
     space == "X" || space == "O"
    end
  
    if full && !won?
      true
    else
      false
    end
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    winning_array=nil
     WIN_COMBINATIONS.each do |arr|
        if @board.cells[arr[0]] == "X" && @board.cells[arr[1]] == "X" && @board.cells[arr[2]] == "X" ||
            @board.cells[arr[0]] == "O" && @board.cells[arr[1]] == "O" && @board.cells[arr[2]] == "O"
            winning_array=arr # return the win_combination indexes that won.
        end
    end
    if winning_array !=nil
      @board.cells[winning_array[0]]
    end
  end

def turn
  player=self.current_player
  move=player.move(board)

  while !@board.valid_move?(move)
    puts "INVALID MOVE: Move again."
    move=player.move(board)
  end
  
  @board.update(move,player)
  @board.display

    
end#end turn method

def play
  while !over?
    turn
  end
  
  if self.won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end








end #end class


# c=Computer.new("X")


#  game=Game.new(c)
#   puts game.board
#    c.move(game.board)
# game.turn 
# game.board.display
# game.turn 
# game.board.display
# game.turn 
# game.board.display
# game.turn 
# game.board.display
# game.turn 
# game.board.display
# game.turn 
# game.board.display










