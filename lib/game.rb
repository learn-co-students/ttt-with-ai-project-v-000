class Game
attr_accessor :player_1, :player_2

def board
@board


end

def board= (board)
@board = board
end


#----------------------------------------------------
def start_up
puts "Welcome to tic-tac-toe. What type of game would you like to play?"
puts "Type 'one player' to play against the computer"
puts "Type 'two player' to play against a human friend"
puts "Type 'cyborg max super battle' to launch the WWIII of ai tic-tac-toe."
puts "type 'done' if you don't like this game anymore and want to go home"
game_type = gets.strip

case game_type
            when "one player"
              one_player_setup
            when "two player"
              two_player_setup
            when "cyborg max super battle"
                cyborg_setup
            when "done"

            else
                start_up
            end



end


def one_player_setup
                player_1 = Players::Human.new("X")
                player_2 = Players::Computer.new("O")
                new_board = Board.new
                initialize(player_1,player_2,new_board)
                puts "Player 1 (you) goes first and plays with an #{player_1.token}."
                puts "Player 2 (the cyborg living in your laptop) goes second and plays with an #{player_2.token}."
                play
                start_up
end

def two_player_setup
                player_1 = Players::Human.new("X")
                player_2 = Players::Human.new("O")
                new_board = Board.new
                initialize(player_1,player_2,new_board)
                puts "Player 1 (you) goes first and plays with an #{player_1.token}."
                puts "Player 2 (your friend) goes second and plays with an #{player_2.token}."
                play
                start_up
end

def cyborg_setup
                results = []
                cat_wins = 0
                x_wins = 0
                o_wins = 0
                puts "How many games do you want the cyborgs to play?"
                num_games = gets.strip.to_i

                num_games.times{
                player_1 = Players::Computer.new("X")
                player_2 = Players::Computer.new("O")
                new_board = Board.new
                initialize(player_1,player_2,new_board)
                results << cyborg_play
                }
                puts "//////////////////////////////////////////////////////////////////////////////////"
                puts "//////////////////////////////////////////////////////////////////////////////////"
                puts "//////////////////////////////////////////////////////////////////////////////////"
                puts "///////////                CYBORG BATTLE COMPLETE                /////////////////"
                puts "//////////////////////////////////////////////////////////////////////////////////"
                puts "//////////////////////////////////////////////////////////////////////////////////"
                puts "//////////////////////////////////////////////////////////////////////////////////"
                sleep(2)
                puts "Tabulating final results..."
                sleep(3)
                puts "Carrying the 7."
                sleep(3)
                puts"Shit. Actually, carrying the 4."
                sleep(2)
                puts"...4 pi r squared"
                sleep(2)
                results.each{|winner|
                            if winner == "CatGame"
                                cat_wins += 1
                            elsif winner == "X"
                                x_wins += 1
                            elsif winner == "O"
                                o_wins += 1
                            end

                            }
                sleep(3)
                puts
                puts
                puts
                puts "Cyborg X: #{x_wins}"
                puts "Cyborg O: #{o_wins}"
                puts "Cat: The cat won #{cat_wins} times"
                sleep(3)
                puts
                puts
                puts
                puts "But remember, you're all winners in your mothers' books."
                puts
                puts
                puts
                puts
                sleep(12)
                puts "Reinitializing the Terradactyl"
                sleep(2)
                puts
                sleep(2)
                puts
                sleep(2)
                start_up
end             





#----------------------------------------------------
def initialize (player_1 = Players::Human.new("X") ,player_2 = Players::Human.new("O"), board = Board.new)

@board = board
@player_1 = player_1
@player_2 = player_2
end





#----------------------------------------------------
#here's a constant that defines all win combinations
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]

]


#--------------------------------------------------------
#input to index converts the input from string to integer
#and updates it from a "board index" to an array index (-1)
def input_to_index (move)
  #note that with #to_i, if there are no ints, it will eval
  #to zero and the method will return -1 as a result
return move.to_i - 1
end

#--------------------------------------------------------
def turn

current_move = current_player.move(@board)

  #checks validity of move and if it passes, displays it, otherwise
  #re-prompts user to enter a valid move

  if @board.valid_move?(current_move)
            @board.update(current_move,current_player)
            @board.display
  
  else
            turn
  end

end

#--------------------------------------------------------
def turn_count
  total_turns = @board.cells.count("X") + @board.cells.count("O")
  return total_turns
end

#--------------------------------------------------------
def current_player
  if  turn_count.even?
     return @player_1
  elsif @board.cells.count(@player_1.token) > @board.cells.count(@player_2.token)
    return @player_2
  elsif @board.cells.count(@player_1.token) < @board.cells.count(@player_2.token)
    return @player_1
  end
end

#----------------------------------------------------
def won?
  x_spots = @board.cells.each_index.select {|i| @board.cells[i] == "X"}
  o_spots = @board.cells.each_index.select {|i| @board.cells[i] == "O"}
  is_a_win = false



    #for each of the winning arrays, do any these sets of 3 spots all exist in the filled x/o spots
    #if the 3 spots from any of the win arrays are all found in the x spots (each one is checked below)
    #then this will return true
    x_win = WIN_COMBINATIONS.each { |current_win_array|
    #so for this current win array (1 of the 8 possible wins in win_combinations)
    #are #all? of its elements #included? in the x_spots
    #only if all of the win array spots are found in x_spots, will it return true
    if current_win_array.all? { |current_win_spot| x_spots.include?(current_win_spot) }
      is_a_win = current_win_array
    end

    }


    #exact same but for o
    o_win = WIN_COMBINATIONS.each { |current_win_array|

      if current_win_array.all? { |current_win_spot| o_spots.include?(current_win_spot) }
        is_a_win = current_win_array
      end

    }

  #note this leverages ruby's unique truthiness and dynaimc
  #typing so it's not entirely  future proof
  if is_a_win.class == Array
    return is_a_win
  elsif is_a_win == false
    return is_a_win
  end

end



#----------------------------------------------------
def full?
  #if any of the elements are blank, it will return true, which means it will be not full
  return !@board.cells.any? {|x| x == " "}
end



#----------------------------------------------------
def draw?
  #it's a draw if the board does not have a win and it's full; otherwise, not a draw
  return !won? && full?
end




#----------------------------------------------------
def over?
  return won? || draw? || full?
end




#----------------------------------------------------
def winner

   #this leverages ruby truthiness, where an array returned evaluates to truthy
  won? ? (return @board.cells[won?[0]]) : (return nil)

end


#--------------------------------------------------------
def play

  #keep calling turns until the game is #over?
  #changed to until to make it a bit more semantic here
  #should be functionally identical to while
  (turn) until over?

  won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")


end



#--------------------------------------------------------
def cyborg_play

  #keep calling turns until the game is #over?
  #changed to until to make it a bit more semantic here
  #should be functionally identical to while
  (turn) until over?

  won? ? winner : "CatGame"


end
#the end of the class (below)
end
