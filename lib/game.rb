require 'pry'

class Game < Human
  attr_accessor :board, :player_1, :player_2
  attr_reader :winner
 
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end
           
  def over?
    board.full?
  end

  def won?  
    c = board.cells
    WIN_COMBINATIONS.detect do |i|
    if c[i[0]] == c[i[1]] && c[i[1]] == c[i[2]] && c[i[0]]!=" "
      true
    else
      false
      end
    end
  end

  def draw?
    if won? 
      return false
    elsif board.full? == true && won? != true
      return true    
    elsif board.full? != true
      return nil
    end
  end 

  def winner
    if won?
      board.cells[won?[0]]
    else
    end
  end

  def turn
    choice = current_player.move(board)
    if board.valid_move?(choice)
      board.update(choice, current_player)
      board.display
    else
      turn
      # puts ""
      # puts ""
    end
  end

  def play
    while !over? && !won? && !draw?
      turn
    end
    if draw?
      puts "*****************"
      puts "Cats Game!"
      puts "*****************"
    elsif won?
      puts "*****************"
      puts "Congratulations #{winner}!"
      puts "*****************"
    else
    end
  end
end
