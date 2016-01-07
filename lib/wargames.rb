class Wargames < Game

  CORNERS = [1, 3, 7, 9]

  def initialize(player_1=Player::Computer.new("X"), player_2=Player::Computer.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @turn_count = 0

  end


  def ai_move(board)

    # if board.turn_count == 0
    # binding.pry
    #   @move = current_player.move(board)
    if center_open? 
      # binding.pry
      @move = "5"
    elsif danger_zone? 
      # binding.pry
      @move = block
    # elsif win_now?
      # binding.pry
    #   @move = @winner
    else
      # binding.pry
      @move = corner || current_player.move(board)
    end
    
  end


  def win_now?
    @poss_winner = @dz_array.collect{|i| 
      @board.cells[i] == current_player.token}
    @poss_winner.size == 2 ? winner : false

  end

  def winner
    @dz_array.select{|i| @board.cells[i] == " "}
  end


  def danger_zone?
    @dz_array = WIN_COMBINATIONS.detect{|a| 
      a.select{|i| @board.cells[i] !=" "}.size==2
    }
    if @dz_array == nil
      return false
    else
      case @dz_array.select{|i| @board.cells[i] == current_player.token}.size
      when 2
        win_now? 
      when 1 
        WIN_COMBINATIONS.delete(@dz_array)
        return false
      when 0
        return true
      end
    end
    

  end

  def block
    @dz_array.detect{|i| @board.cells[i] == " "} + 1
  end

     
  def corner
    CORNERS.detect{|i| @board.cells[i-1] == " "}
  end

  def center_open?
    @board.cells[4] == " "
  end


  def turn
    puts "\e[H\e[2J"
    @board.display
    ai_move(@board)
    @board.update(@move, current_player)
    won?
    # sleep 1
  end

  def play
    until over? 
      turn
    end
    puts "\e[H\e[2J" 
    board.display
    puts "Congratulations #{winner}!" if won?
    puts "Cats Game!" if draw?
   
  end

end

### TEST BOARDS ###
["X", " ", "X", " ", " ", " ", "X", " ", "X"]