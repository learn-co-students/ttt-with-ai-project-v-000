require 'pry'
require_relative "../../config/environment.rb"

class Player::Computer < Player

  attr_accessor :board

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]



  def move(board)
    @board = board


    
    if board.valid_move?(first_move) # MOVE TO CENTER OR CORNER ON FIRST/SECOND MOVE
      first_move
    elsif board.valid_move?(win) # WIN IF POSSIBLE
      win
    elsif board.valid_move?(defend) # BLOCK OPPONENT IF NECESSARY
      defend
    elsif board.valid_move?(corner_trap_preempt) # PREVENT THE "CORNER TRAP" BY MOVING TO A MIDDLE SPACE
      corner_trap_preempt
    elsif board.valid_move?(corner) # MOVE TO A CORNER IF NOTHING ELSE RETURNS TRUE
      corner
    else
      random_move # IF ALL ELSE FAILS, MAKE A RANDOM MOVE
    end
  end

  def defend
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == other_player && @board.cells[combo[1]] == other_player && @board.cells[combo[2]] != token
        break "#{combo[2] + 1}"
      elsif @board.cells[combo[1]] == other_player && @board.cells[combo[2]] == other_player && @board.cells[combo[0]] != token
        break "#{combo[0] + 1}"
      elsif @board.cells[combo[0]] == other_player && @board.cells[combo[2]] == other_player && @board.cells[combo[1]] != token
        break "#{combo[1] + 1}"
      else 
      end
    end
  end

  def win
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == token && @board.cells[combo[1]] == token && @board.cells[combo[2]] != other_player
        break "#{combo[2] + 1}"
      elsif @board.cells[combo[1]] == token && @board.cells[combo[2]] == token && @board.cells[combo[0]] != other_player
        break "#{combo[0] + 1}"
      elsif @board.cells[combo[0]] == token && @board.cells[combo[2]] == token && @board.cells[combo[1]] != other_player
        break "#{combo[1] + 1}"
      else 
      end
    end 
  end

  def corner_trap_preempt
    if @board.cells[0] == other_player && @board.cells[4] == token && @board.cells[8] == other_player
      if @board.valid_move?("2")
        "2"
      else
        "8"
      end
    elsif @board.cells[2] == other_player && @board.cells[4] == token && @board.cells[6] == other_player
      if @board.valid_move?("2")
        "2"
      else
        "8"
      end
    end
  end

  def corner
    if @board.valid_move?("1")
      "1"
    elsif @board.valid_move?("3")
      "3"
    elsif @board.valid_move?("7")
      "7"
    elsif @board.valid_move?("9")
      "9"
    else
    end 
  end
  

  def random_move
    Random.new.rand(1..9).to_s
  end

  def first_move
    if @board.turn_count <= 2 && @board.valid_move?("5")
      "5"
    elsif @board.turn_count <= 2 && @board.valid_move?("1")
      "1"
    end
  end


        
  def other_player
    if token == "X"
      "O"
    else
      "X"
    end
  end

  

end


