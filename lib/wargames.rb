class Wargames < Game
  attr_accessor :games_played, :wins, :cat_counter, :wins_possible


  CORNERS = [0, 2, 6, 8]

  def initialize(player_1=Player::Computer.new("X"), player_2=Player::Computer.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @turn_count = 0
    @games_played = 0  
    @cat_counter = 0 
    possible_wins
  end

  def play
    until @games_played == 5
      until over? 
        turn
      end
      @games_played += 1
      endgame("won") if won?
      endgame("draw") if draw?
      play
    end
    puts "\e[H\e[2J"
    scoreboard
  end

  def turn
    @board.display
    @move = ai_move(@board)
# binding.pry
    @board.ai_update(@move, current_player)
    # sleep 1
    
  end

  def ai_move(board)

    if board.turn_count == 0
    # binding.pry
      current_player.move(board).to_i - 1
    elsif center_open? 
      # binding.pry
      4
    else
      danger_zone? || strategery(current_player)
# binding.pry
    end
    
  end

  def danger_zone?
    # binding.pry
    @dz_array = @wins_available.detect{|a| 
      a.select{|i| @board.cells[i] !=" "}.size==2}
    if @dz_array == nil
      return false
    else 
      case @dz_array.select{|i| @board.cells[i] == current_player.token}.size
      when 2
        # binding.pry
        win_move 
      when 1 
        @wins_available.delete(@dz_array)
        # binding.pry
        danger_zone?
      when 0
        @wins_available.delete(@dz_array)
        # binding.pry
        block_win
      end
    end
  end

  def strategery(player)
    # get_schwifty
    if @wins_available.empty? && corner_open?
      corner(CORNERS) 
      # else
      #   player.move(board).to_i - 1
      # end
    # elsif schwifty.collect{|a| a & CORNERS}.flatten.empty? || !corner_open?
    #   schwifty.flatten.detect{|i| @board.cells[i] = " "}
    else
      get_schwifty(player)
    end
# binding.pry
  end

  def get_schwifty(player)
    @schwifty = @wins_available.select{|a| 
      a.detect{|i| @board.cells[i] == player.token}}.flatten.uniq
    @unschwifty = @wins_available.select{|a| 
        a.detect{|i| @board.cells[i] != player.token && " "}}.flatten.uniq
    if @schwifty.empty? 
      if corner_open?
        corner(CORNERS)
      elsif !@unschwifty.empty?
  # binding.pry
        @unschwifty.detect{|i| @board.cells[i] == " "}
  # binding.pry
      else
        player.move(board).to_i - 1
      end

  # binding.pry
      # player.move(board).to_i - 1 ###THIS LIKELY LOSES THE GAME
    elsif (@schwifty & CORNERS).empty?
      @schwifty.sort_by{rand}.detect{|i| @board.cells[i] == " "}
    else
      corner(@schwifty & CORNERS)
    end
  end

  def possible_wins
    @wins_available = WIN_COMBINATIONS.select{|a|
      a.select{|i| @board.cells[i] == " "}.size >= 2}
  end
  
  def win_move
    # binding.pry
    @dz_array.detect{|i| @board.cells[i] == " "} 
  end

  def block_win
    @dz_array.detect{|i| @board.cells[i] == " "} 
  end

  def corner_open?
    CORNERS.collect{|i| @board.cells[i] == " "}.empty? ? false : true 
# binding.pry
  end

  def corner(moves)
    moves.sort_by{rand}.detect{|i| @board.cells[i] == " "}
# binding.pry
  end

  def center_open?
    @board.cells[4] == " "
  end

  

  def endgame(result)
    # board.display
    case result
      when "won"
        [player_2, player_1].detect{|p| p.token == winner}.wins += 1
        # current_player.wins += 1
        # binding.pry
        scoreboard
        puts "Congratulations #{winner}!"
        
      when "draw"
        @cat_counter += 1
        scoreboard
        puts "Cats game!"
        
      end
    
    # sleep 1
    board.reset!
    possible_wins
  end

 def scoreboard
    puts "Games: #{games_played}"
    puts "WINS: "
    puts "X: #{player_1.wins}, O: #{player_2.wins} \n---------\n"
    puts "CAT: #{cat_counter}\n\n"
    # binding.pry
  end

end