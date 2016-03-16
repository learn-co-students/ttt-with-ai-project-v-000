require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2, :token
  attr_reader :cells


  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  def initialize(player_1 = "X", player_2 = "O", board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      @board = Board.new
    else
      @board = board
    end
    if player_1 == "X"
      @player_1 = Human.new(player_1)
    else
      @player_1 = player_1
    end
    if player_2 == "O"
      @player_2 = Human.new(player_2)
    else
      @player_2 = player_2
    end
    


    
  end

  def current_player
    if @board.turn_count / 2 != 0
      @player_1
    else
      @player_2
    end
  end

  def over?
    

    if !@board.cells.include?(" ") || won?
      return true
    else
      return false
    end
  end


  end


private
  
  
  def draw?
    if !@board.cells.include?(" ") && !won?
      true
    else
      false
    end
  end

  def winner
    unless draw?
      if current_player == @player_1
       @player_2.token
      else
        @player_1.token
      end
    end
  end

  


  def won?
    status = false

    Game::WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        binding.pry
        status = true
        
        return status
      elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
        status = true
        return status

    end
    return status
  end







    






end


