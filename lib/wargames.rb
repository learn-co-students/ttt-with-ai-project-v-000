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
    until @games_played == 100
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
    ai_move(@board)
    @board.update(@move, current_player)
  end

  def endgame(result)
    board.display
    case result
      when "won"
        [player_2, player_1].detect{|p| p.token == winner}.wins += 1
        # current_player.wins += 1
        # binding.pry
        puts "Congratulations #{winner}!"
        
      when "draw"
        @cat_counter += 1
        puts "Cats game!"
        
      end
    scoreboard
    # sleep 1
    board.reset!
    possible_wins
  end

  def ai_move(board)

    if board.turn_count == 0
    # binding.pry
      @move = current_player.move(board)
    elsif center_open? 
      # binding.pry
      @move = "5"
    else
      danger_zone? || strategery(current_player)
    end
    
  end

  def danger_zone?
    # binding.pry
    @dz_array = @possible_wins.detect{|a| 
      a.select{|i| @board.cells[i] !=" "}.size==2}
    if @dz_array == nil
      return false
    else 
      case @dz_array.select{|i| @board.cells[i] == current_player.token}.size
      when 2
        # binding.pry
        @move = win_move 
      when 1 
        @possible_wins.delete(@dz_array)
        danger_zone?
      when 0
        @possible_wins.delete(@dz_array)
        @move = block_win
      end
    end
  end

  def strategery(player)
    # binding.pry
    schwifty = @possible_wins.select{|a| 
      a.detect{|i| @board.cells[i] == player.token}}
# binding.pry
    if schwifty.empty?
      corner(CORNERS) || player.move(board)
    else
      corner(schwifty.sort_by{rand}.collect{|a| a & CORNERS}.flatten) || schwifty.select{|a| a.select{|i| @board.cells[i] == " "}}
      # binding.pry
    end
# binding.pry
  end

  def win_move
    # binding.pry
    @dz_array.detect{|i| @board.cells[i] == " "} + 1
  end

  
  def possible_wins
    @possible_wins = WIN_COMBINATIONS.select{|a|
      a.select{|i| @board.cells[i] == " "}.size >= 2}
  end
    

  def block_win
    @dz_array.detect{|i| @board.cells[i] == " "} + 1
  end

  def corner(moves)
    moves.empty? ? false : @corner = moves.sort_by{rand}.detect{|i| @board.cells[i] == " "}
    @corner == nil ? false : @corner + 1
     
  end

  def center_open?
    @board.cells[4] == " "
  end

 def scoreboard
    puts "Games: #{games_played}"
    puts "WINS: "
    puts "X: #{player_1.wins}, O: #{player_2.wins} \n---------\n"
    puts "CAT: #{cat_counter}\n\n"
    # binding.pry
  end

end