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
    until @games_played == 10000
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
# binding.pry
    @board.ai_update(@move, current_player)
    # sleep 1
    
  end

  def ai_move(board) ##FIRST MOVE IS RANDOM, SECOND IS CENTER OR, IF THAT'S FILLED, A CORNER
  if board.turn_count == 0
# # binding.pry
    current_player.move(board).to_i - 1
    # if center_open? 
  
    #   4
    else
      danger_zone? || strategery(current_player)
    end
    
  end

  def danger_zone? ## LOOKS THROUGH WINNING ARRAYS FOR ANY WITH TWO SPOTS MARKED
                   ## --IF AN IMMEDIATE WIN IS AVAILABLE, TAKES THAT
                   ## --IF OPPONENT WIN IMMINENT, BLOCKS THAT
                   ## --IF NEITHER OF THOSE THINGS, DELETES THAT ARRAY, LOOKS FOR ANOTHER
                   ## --IF THERE ARE NO POTENTIAL WINNERS WITH TWO SPOTS MARKED, HANDS OFF TO
                   ##   #STRATEGERY

  # binding.pry 
## W_C ARRAYS W/2 SPOTS TAKEN  
    @check = @win_combinations.select{|a| a.select{|i| @board.cells[i] !=" "}.size==2} 
    if @check.empty?
      return false
    else 

      @dz_array = @check.detect{|a| a.select{|i| @board.cells[i] == current_player.token}}
      case @dz_array.select{|i| @board.cells[i] == current_player.token}.size
      when 2
  # binding.pry  
        win_block 
      when 0   ##<--CHECKS FOR OPPONENT WIN IMMINENT
  # binding.pry       
        @win_combinations.delete(@dz_array)
    
        win_block
      when 1 
# binding.pry  
        @win_combinations.delete(@dz_array) ##<--NOBODY CAN WIN THAT WAY, DELETE IT, LOOK FOR ANOTHER
    
        danger_zone?
      end
  # binding.pry
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
    if @win_combinations.empty? ##<--NOBODY CAN WIN THIS GAME
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
    @poss_danger = @win_combinations.select{|a| a.none?{|i| @board.cells[i] == player.token}} ##<--WINS OUT THERE: OTHER GUY'S OR EMPTY WIN_ARRAYS
                                                   
    @opp_wins = @poss_danger.select{|a| a.select{|i| @board.cells[i] == " "}.size==2} ##<--ARRAYS OTHER GUY COULD STILL WIN (CALLED ON FILTERED W_C)
    
    @my_wins = @win_combinations.select{|a| a.any?{|i| @board.cells[i] == player.token}} ##<--ARRAYS I COULD WIN (CALED ONLY ON FILTERED W_C)

    @contested_spaces = @opp_wins.flatten & @my_wins.flatten ##<--SELF-EXPLANATORY
# binding.pry
## D_Z SHOULD HAVE FILTERED OUT EVERY ARRAY W/MORE THAN 1 SPOT TAKEN, MEANS NO WINS LEFT
    if @win_combinations.empty? 
      if center_open?
        4
      elsif corner_open?
        corner(CORNERS)
      else
        current_player.move(board).to_i - 1
      end
## THERE ARE WINS OUT THERE. CHECK IF I'M THE ONLY ONE W/CLAIM
    elsif @poss_danger.empty? 
      if center_open? 
        4
  ## ONLY W_C OUT THERE MUST INCLUDE ME (SOME EXTRA CKS HERE, NEEDS TRIMMING)      
      elsif @my_wins.size > 0 ##<--CHECKS FIRST CASE, PRIORITIZES CORNERS (ELSE TAKE RANDO EDGE)
        if (@my_wins.flatten & CORNERS).size > 0 && corner_open?
          corner(@my_wins.flatten & CORNERS)
        else
          @my_wins.flatten.sort_by{rand}.detect{|i| @board.cells[i] == " "}
        end
      else ##<--3rd CASE (NO W_C AVAIL, JUST PLAYING OUT THE STRING)
        current_player.move(board).to_i - 1 
      end
## EITHER THE OPPONENT HAS CLAIMED SOMETHING OR THERE'S AN EMPTY W_C
    elsif @opp_wins.empty?  ##<--MEANS THERE ARE WIDE OPEN W_C ARRAYS
      if @my_wins.size > 0 ##<--THERE ARE WINS, BUT OPP HASN'T CLAIMED ANY. HAVE I?
                           ##<--FOR NOW, NORMAL ROUTINE (CENTER, CORNER, RANDO)
                           ##   NEXT STEP WOULD BE TO CHOOSE ONE THAT LEAVES A WIN OPEN EVEN AFTER INEVITABLE BLOCK
        if center_open?
          4
        elsif (@my_wins.flatten & CORNERS).size > 0 && corner_open?
          corner(@my_wins.flatten & CORNERS)
        else
          @my_wins.flatten.sort_by{rand}.detect{|i| @board.cells[i] == " "}
        end
      else
        if center_open?
          4
        elsif corner_open?
          corner(CORNERS)
        else
          current_player.move(board).to_i - 1
        end
      end
## OPPONEN HAS CLAIMED A POTENTIAL WIN. TRY TO BLOCK (& STAKE MY OWN CLAIM IF POSS)
    else 
      if @contested_spaces.empty? ##--FIRST LOOK FOR A BLOCK THAT FALLS INTO ONE OF MY POT WINS(TRIGGER D_Z)
        if center_open?
          4
        elsif (@opp_wins.flatten & CORNERS).size > 0 && corner_open?
          corner(@opp_wins.flatten & CORNERS)
        else
          @opp_wins.flatten.sort_by{rand}.detect{|i| @board.cells[i] == " "}
        end
      else ##<--THERE'S A MOVE THAT BLOCKS HIM & ADDS TO A W_C ARRAY I'VE CLAIMED. CHOOSE ONE
        @contested_spaces.detect{|i| @board.cells[i] == " "} ## MAYBE RANDOMIZE LATER


         ##   --FAILING THAT, LOOK FOR A CORNER BLOCK
         ##   --FAILING THAT, PICK A RANDO BLOCK
      end
    end  


        


    
  end

  def possible_wins ## CREATES COPY OF WIN_COMBINATIONS, IS RUN ONLY ONCE PER GAME, AFTER BOARD RESET
    @win_combinations = WIN_COMBINATIONS.select{|a|
      a.select{|i| @board.cells[i] == " "}.size >= 2}
  end
  
  def win_block
# binding.pry
    @dz_array.detect{|i| @board.cells[i] == " "} 
  end

#   def block_win
# binding.pry
#     @dz_array.detect{|i| @board.cells[i] == " "} 
#   end

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