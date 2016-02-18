require_relative 'board.rb'
require_relative 'human.rb'
class Game
  WIN_COMBINATIONS=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6]]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=nil, player_2=nil, board=nil)
      board = Board.new if !board
      player_1 = Human.new("X") if !player_1
      player_2 = Human.new("O") if !player_2
      
      @board = board
      @player_1 = player_1
      @player_2 = player_2
  end

  def current_player
    if (board.turn_count % 2) == 0
      player_1
    else
      player_2
    end
  end
  
  def over?

  end

  def won?
    won=false
    WIN_COMBINATIONS.each do |arr|
        if board.cells[arr[0]] == "X" && board.cells[arr[1]] == "X" && board.cells[arr[2]] == "X" ||
            board.cells[arr[0]] == "O" && board.cells[arr[1]] == "O" && board.cells[arr[2]] == "O"
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
    draw? || won?
  end

  def winner
    winning_array=nil
     WIN_COMBINATIONS.each do |arr|
        if board.cells[arr[0]] == "X" && board.cells[arr[1]] == "X" && board.cells[arr[2]] == "X" ||
            board.cells[arr[0]] == "O" && board.cells[arr[1]] == "O" && board.cells[arr[2]] == "O"
            winning_array=arr # return the win_combination indexes that won.
        end
    end
    if winning_array !=nil
      board.cells[winning_array[0]]
    end
  end

def turn
    player=current_player
    
    if !board.valid_move?(player.move(board))
      player.move(board)
    end

end#end turn method










end #end class


# game = Game.new
#       game.board.cells = ["X", "O", "X", "O", "X", " ", "O", "X", "O"]

# puts game.turn


