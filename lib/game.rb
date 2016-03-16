

class Game

  attr_accessor :board, :player_1, :player_2, :token, :cells, :move, :player
 

  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  def initialize(player_1 = "X", player_2 = "O", board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      @board = Board.new
    else
      @board = board
    end
    if player_1 == "X"
      @player_1 = Player::Human.new(player_1)
      @player_1.board = @board
    else
      @player_1 = player_1
      @player_1.board = @board
    end
    if player_2 == "O"
      @player_2 = Player::Human.new(player_2)
      @player_2.board = @board
    else
      @player_2 = player_2
      @player_2.board = @board
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
  



  
  
  def draw?
    if !@board.cells.include?(" ") && !won?
      true
    else
      false
    end
  end

  def winner
    if draw?
      return nil
    elsif @board.cells.count("X") > @board.cells.count("O")
      return "X"
    elsif @board.cells.count("O") > @board.cells.count("X")
      return "O"
    else 
      return nil
    end
  end
  

  


  def won?
    status = false

    Game::WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        
        status = true
        
        return status
      elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
        status = true
        return status
      end

    end
    return status
  end


  def turn
    player = current_player
    
    if player.class == Player::Human

      move = player.move(@board.cells)
      if !@board.valid_move?(move)
        puts "Sorry that move wasn't valid. Try again."
        turn
      else
        @board.update(move,self)
        return @board.cells
      end

    elsif player.class == Player::Computer
      player.move(@board)
    end
      

  end



end


