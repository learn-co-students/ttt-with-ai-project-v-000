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
  # binding.pry
      play
    end
    puts "\e[H\e[2J"
    scoreboard
  end

  def turn
    @board.display
    @move = ai_move(@board)
    @board.ai_update(@move, current_player)
    # sleep 1
    
  end

  def ai_move(board) ##FIRST MOVE IS RANDOM, SECOND IS CENTER OR, IF THAT'S FILLED, A CORNER
    if board.turn_count == 0
# binding.pry
      current_player.move(board).to_i - 1
    # elsif center_open? 
  
    #   4
    else
      danger_zone? || strategery(current_player)
    end
    
  end

  def danger_zone? ## LOOKS THROUGH WINNING ARRAYS FOR ANY WITH TWO SPOTS MARKED
                   ## --IF AN IMMEDIATE WIN IS AVAILABLE, TAKES THAT
                   ## --IF OPPONENT WIN IMMINENT, TAKES THAT
                   ## --IF NEITHER OF THOSE THINGS, DELETES THAT ARRAY, LOOKS FOR ANOTHER
                   ## --IF THERE ARE NO POTENTIAL WINNERS WITH TWO SPOTS MARKET, HANDS OFF TO
                   ##   #STRATEGERY

  # binding.pry 
    @check = @wins_available.select{|a| 
      a.select{|i| @board.cells[i] !=" "}.size==2} ##<--ARRAY FROM W_C CONSTANT W/2 SPOTS FILLED
    if @check.empty?
      return false
    else 
      @dz_array = @check.detect{|a| a.select{|i| @board.cells[i] == current_player.token}}
      case @dz_array.select{|i| @board.cells[i] == current_player.token}.size
      when 2
  binding.pry  
        win_move 
      when 0   ##<--CHECKS FOR OPPONENT WIN IMMINENT
  binding.pry       
        @wins_available.delete(@dz_array)
    
        block_win
      when 1 
binding.pry  
        @wins_available.delete(@dz_array) ##<--NOBODY CAN WIN THAT WAY, DELETE IT, LOOK FOR ANOTHER
    
        danger_zone?
      end
  binding.pry
    end
  end

  def strategery(player) ## RUNS ON @WINS_AVAIALABLE, WHICH SHOULD HAVE BEEN TRIMMED BY D_Z?
                         ## --IF THE BOARD'S OPEN & THERE AREN'T WINS AVAILABLE, LOOKS FOR A CORNER
                         ##   FIRST, THEN AND ONLY THEN PICKS AT RANDOM
                         ##   --THIS IS EXTRANEOUS, ULTIMATELY (IF NOBODY CAN WIN, GAME SHOULD)
                         ##     END), BUT FOR NOW I WANT TO SEE GAMES PLAY THROUGH TO HELP 
                         ##     ME FIND BUGS
                         ## --IF A WIN IS STILL POSSIBLE, FIRST LOOKS TO BLOCK OPPONENT
                         ##   --CREATES SUB-ARRAY OF WINS_AVAILABLE CONTAINING JUST OPP. MARKER
                         ##     --CHECKS THROUGH THAT FOR AN OPEN CORNER SPACE & TAKES IT OR
                         ##     --TAKES FIRST OPEN BLOCKING SPACE
                         ## --IF SUB-ARRAY IS EMPTY, THAT MEANS IT'S THE ONLY PLAYER WITH A 
                         ##   POSSIBLE WIN AVAILABLE
                         ##   --CHECKS WINS_AVAILABLE FOR CORNER & TAKES ONE OR
                         ##   --IF NO CORNERS OPEN, TAKES NEXT AVAIL SPACE FROM WINS_AVAIL 

                         ##   # get_schwifty
  # binding.pry
    if @wins_available.empty? ##<--NOBODY CAN WIN THIS GAME
      if corner_open?

        corner(CORNERS) ##<--ULT UNNECESSARY, BUT HERE TO MAKE SURE THE REST WORKS
      else
        current_player.move(board).to_i - 1 
      end
      # else
      #   player.move(board).to_i - 1
      # end
    # elsif schwifty.collect{|a| a & CORNERS}.flatten.empty? || !corner_open?
    #   schwifty.flatten.detect{|i| @board.cells[i] = " "}
   
    else
      get_schwifty(player) ##<--NO IMMINENT WINS, BUT WINS STILL POSSIBLE
    end
  end

  def get_schwifty(player)  
    @poss_danger = @wins_available.select{|a| 
      a.none?{|i| @board.cells[i] == player.token}} ##<--W_C ARRAY W/O CURR_PLAY TOKEN
                                                   ## --COULD BE ENTIRELY EMPTY, THOUGH
    @opp_wins = @poss_danger.select{|a| 
        a.select{|i| @board.cells[i] == " "}.size==2} ##<--IN CASE NEED IT LATER; COULD BE EMPTY
   
# binding.pry
    if @poss_danger.empty? ##<--IF ANYBODY WINS, IT WON'T BE THE OTHER GUY
      @good_moves = @wins_available.select{|a| a.select{|i| @board.cells[i] == " "}.size==2}
      if @good_moves.size > 0 ##<--CHECK TO SEE IF OTHER WINS_AVAIL ARRAYS ARE OPEN OR OURS
        if center_open ##<--CENTER IS VALUABLE
          4
        elsif corner_open?
          corner(@good_moves.flatten & CORNERS)
        else
          @good_moves.detect{|i| @board.cells[i] = " "} ##<--NO WINNING CORNERS OPEN, JUST PICK ONE POT WINNER
        end
      else ##<--WINS_AVAIL INCLUDES AT LEAST ONE EMPTY ARRAY
        if center_open? ##<--THIS PROB NEEDS TO BE ABSTRACTED OUT
          4
        elsif corner_open?
          corner(@wins_available.flatten & CORNERS)
        else
          @wins_available.flatten.sort_by{rand}
        end
      end

          

    elsif @opp_wins.size > 0 ##<--OTHER GUY HAS WINS AVAILABLE, LET'S CHECK THAT
        if corner_open? 
          corner(@opp_wins.flatten & CORNERS)
        else 
          @opp_wins.flatten.sort_by{rand}.detect{|i| @board.cells[i]==" "}  
        end
    else  ##<--THERE ARE WINS OUT THERE, BUT NOT THE OTHER GUY'S, SO LET'S PICK ONE
        if center_open?
          4
        elsif corner_open?
          corner(@poss_danger.flatten & CORNERS)
        else
          @poss_danger.flatten.sort_by{rand}.detect{|i| @board.cells[i] == " "}
        end
      
    
  # binding.pry  
    end
  end

  def possible_wins ## CREATES COPY OF WIN_COMBINATIONS, IS RUN ONLY ONCE PER GAME, AFTER BOARD RESET
    @wins_available = WIN_COMBINATIONS.select{|a|
      a.select{|i| @board.cells[i] == " "}.size >= 2}
  end
  
  def win_move

    @dz_array.detect{|i| @board.cells[i] == " "} 
  end

  def block_win
    @dz_array.detect{|i| @board.cells[i] == " "} 
  end

  def corner_open?
    CORNERS.select{|i| @board.cells[i] == " "}.empty? ? false : true 
  end

  def corner(moves)
    moves.sort_by{rand}.detect{|i| @board.cells[i] == " "}
  end

  def center_open?
    @board.cells[4] == " "
  end

  def space(index)
    @board.cells[index]
  end
  

  def endgame(result)
    # board.display
    case result
      when "won"
        [player_2, player_1].detect{|p| p.token == winner}.wins += 1
        # current_player.wins += 1
    
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

  end

end