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
    if board.turn_count.odd? == true#0 is an even number, as all are even except odd#s'
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
    draw? || won?
 end

 def winner
   win = won?
   return if win.nil? # IF win is nothing IS TRUE
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
       puts "hi i am BEFORE UPDATE call method on Board Object"
   board.update(player_position, player)
        puts "hi i am after UPDATE call on Game Class"

 end
 
 def valid_move?(input)
   board.valid_move?(input)
 end
 
 def taken?(input)
   board.taken?(input)
 end

 def turn
   # the most important part of finding a method defintion is understanding the receiver.
   # if board is a method, what is it being called on? "self"
   user_input = current_player.move(self.board)
   puts "#{user_input}"
   if valid_move?(user_input)
      puts "#{user_input}"
     update(user_input, current_player)
     puts "hi i am after UPDATE method in Game Class"
     display_board
     puts "hi i am after display_board"
   else
     turn #here is the missing line for 9-12 pm
   end
 end

 def play
    puts "about to start playing"
    until self.over? #do #=> "is true" but skips on the 2nd turn
      self.turn# returns this line
    end
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end
end
