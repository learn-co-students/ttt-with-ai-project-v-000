#require 'pry'
#require_relative "./players/human.rb"
#require_relative "./players/computer.rb"
class Game
  attr_accessor :board, :player_1, :player_2
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
   #assigns token "X" and "O" to respective player in Game.new
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row, #had extra comma&deleted comma, #add comma to delineate element of array WIN_COMBINATIONS
    [3,4,5],  # Middle row, #add comma to delineate element of array WIN_COMBINATIONS
    [6,7,8],  # last row#add comma to delineate element of array WIN_COMBINATIONS
    [0,3,6], #first columns#add comma to delineate element of array WIN_COMBINATIONS
    [1,4,7],  #second columns#add comma to delineate element of array WIN_COMBINATIONS
    [2,5,8],  # third columns#add comma to delineate element of array WIN_COMBINATIONS
    [0,4,8],  #diagnoal from nw to se#add comma to delineate element of array WIN_COMBINATIONS
    [2,4,6],  #diagnoal from ne to sw#add comma to delineate element of array WIN_COMBINATIONS
  ]
 def current_player
    if board.turn_count.odd? == true
      player_2
    else
      player_1
    end
 end
 def won?
   WIN_COMBINATIONS.find do |win|
     position_1 = board.cells[win[0]]
     position_2 = board.cells[win[1]]
     position_3 = board.cells[win[2]]
     position_1 == position_2 && position_2 == position_3 && position_1 != " "
   end
 end
 def draw?
    !won? && full?
 end
 def full?
   board.cells.all? { |elem|
     elem == "X"  || elem == "O" || elem != " "
   }
 end
 def over?
    !won? && full? || won?
 end
 def winner
   win = won?
   return if win.nil?
   position_1 = board.cells[win[0]]
   position_2 = board.cells[win[1]]
   position_3 = board.cells[win[2]]
   if position_1 == "X"
     return "X"
   elsif position_1 == "O"
     return "O"
   else
     false
   end
 end
 def display_board
   puts " #{board.cells[0]} | #{board.cells[1]} | #{board.cells[2]} "
   puts "-----------"
   puts " #{board.cells[3]} | #{board.cells[4]} | #{board.cells[5]} "
   puts "-----------"
   puts " #{board.cells[6]} | #{board.cells[7]} | #{board.cells[8]} "
 end
 def input_to_index(user_input)
   user_input.to_i-1
 end

 def update(player_position, player)
   board.update(player_position, player)
 end
 def valid_move?(input)
   board.valid_move?(input)
 end
 def taken?(input)
   board.taken?(input)
 
 end
 def turn
   # the most important part of finding a method defintion is understanding the receiver.

   # if board is a method, what is it being called on?

   user_input = current_player.move(self.board)
   #input= input_to_index(user_input)
   if valid_move?(user_input)
     update(user_input, current_player)
     display_board
   else
     turn #here is the missing line for 9-12 pm
   end
 end

 def play
   # puts "what kind of game do you want to play? 0,1, or 2 player"
   # player_count = gets.chomp
   # if player_0 == "1"
   #     game = Game.new(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"))
   # elsif player == "2"
   #    game = Game.new(player_1=Players::Human.new("O"),player_2=Players::Human.new("X"))
   # end
    until self.over?
      self.turn
    end
    #CLI should prompt the user if they would like to play again and 
    #allow them to choose a new configuration for the game as described above. 
    #If the user doesn't want to play again, exit the program. Response: how?
    puts "would you like to play again? enter 'Y' or 'N' "
    user_response = gets.strip
    if user_response == "Y"
      play
    else 
      puts "WHAT?!!!"
    end
  end
end
