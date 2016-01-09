require 'pry'
class Game
  attr_reader :board, :player_1, :player_2, :total_ties
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[1,4,7],[0,3,6],[2,5,8]] #defines all of the possible combinations to win
   
  def board=(board) 
    @board=[] 
  end
  
  def player_1=(player_1) 
    @player_1=player_1
  end
   
  def player_2=(player_2)
    @player_2=player_2
  end
  
  def current_player #determines the current player using turn count from the Board class
    if board.turn_count%2==0
      return player_1
    else
      return player_2
    end
  end
   
  def over? #checks if there are any openings on the board
    if !board.full? && !won?
      return false
    else
      return true
    end
  end
  
  def won? #determines if one of the WIN_COMBINATIONS has been completed
    WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]]=="X" &&  board.cells[win_combo[1]]=="X" &&  board.cells[win_combo[2]]=="X" 
        return true
      elsif board.cells[win_combo[0]]=="O" &&  board.cells[win_combo[1]]=="O" &&  board.cells[win_combo[2]]=="O"
        return true
      end
                        end
     return false
  end
   
  def draw? #uses over? and won? methods to determine a draw game
    puts "Cats Game!" 
  end
   
  def winner
    WIN_COMBINATIONS.each do |win_combo| #uses the main part of the won? method but a different return value
      if board.cells[win_combo[0]]=="X" &&  board.cells[win_combo[1]]=="X" &&  board.cells[win_combo[2]]=="X" 
        puts "Congratulations X!" 
      elsif board.cells[win_combo[0]]=="O" &&  board.cells[win_combo[1]]=="O" &&  board.cells[win_combo[2]]=="O"
        puts "Congratulations O!" 
      end
                        end
  end
   
  def turn 
    player=current_player #sets the player using the current_player method
    response=player.move(board) #uses the move method from the Human class
    until board.valid_move?(response)==true #uses the valid_move? method from the board class
      puts "invalid input, please follow the rules!"
      puts "The following moves are available #{board.available_moves}"
      response=player.move(board)
    end
    board.update(response, player) #updates the board using the board class
    player=current_player #updates the current player
  end
   
  def play #the play method
    until over? #checks with an until loop for if the game is over
      turn #is the players turn
      board.display
    end
    if won? #is a catch for if the until loop says the game is over before entering the loop, these will declare the winner or a draw   
         return winner
    else
      @total_ties+=1
      draw? 
    end
  end
   
  def initialize 
    @total_ties=0 #initializes the instance variable to keep track of the ties for each Game instance for WARGAMES
  end
   
  def wargames
    @player_1=Computer.new("X", "USA") #initializes a new game each game
    @player_2=Computer.new("O", "USSR")
    play_times=0 #keeps track of the amount of times play has been called
    @total_ties=0
    until play_times==100 #a loop forcing play to be called 100 times
      @board=Board.new 
      play
      play_times+=1 #counts the number of games played
    end
    if total_ties!=100 #if any of the games had a winner, it is nuclear death
      puts "Out of #{play_times} games, there have been #{@total_ties} draws!"
      abort("NUCLEAR DEATH! LONG LIVE THE COCKROACHES!")
    else
      puts "Out of #{play_times} games, there have been #{@total_ties} draws!"
      abort("Mr. Gorbachev, TEAR DOWN THIS WALL!") #if all games ended in a tie, then the cold war will continue
    end 
  end
   
  def start #this method controls the actual game
    puts "Hello, How many human players are there this wonderous day?" #welcome message
    num_of_players=gets.chomp #response
    until num_of_players=="0" || num_of_players=="1" || num_of_players=="2"||num_of_players=="WARGAMES" #allowable responses
      puts "Improper Entry, Please Follow The RULES!" #messages for correction
      puts "2 players max!"
      num_of_players=gets.chomp #able to re-enter a number of players
    end
    if num_of_players=="2" #for two human players, initializes the game
      @player_1=Human.new("X", "Pizzeria Uno")
      @player_2=Human.new("O", "2 Fast 2 Furious")
      @board=Board.new
      board.introduction_board
    elsif num_of_players=="1" #for one human player and one computer player, initializes the game
      @player_1=Human.new("X", "Homo-sapien")
      @player_2=Computer.new("O", "Wall-E")
      @board=Board.new
      puts "prepare for DEFEAT!"
      board.introduction_board
    elsif num_of_players=="0" #for computer vs computer game, initializes the game
      @player_1=Computer.new("X", "R2D2")
      @player_2=Computer.new("O", "C3PO")
      @board=Board.new
    elsif num_of_players=="WARGAMES" #for special Wargames mode, 
      wargames
    end
    play #the normal play call for games not done with WARGAMES
    puts "Would you like to play again?" #asking to play again
    play_again_response=gets.chomp.downcase
    if play_again_response=="yes"
      start #restarting the program if you would like to play again
    else
      puts "Auf Wiedersehen" #an exit message if you would not like to play again
    end
  end
end