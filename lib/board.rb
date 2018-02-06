require 'pry'
class Board
  attr_accessor :cells

   def initialize
     reset!
   end

   def reset!
     @cells =  [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   def position(user_input)
     @cells[user_input.to_i - 1]
   end

   def full?
     @cells.all? do |positions|
      positions == "O"  || positions == "X"
     end
   end

   def turn_count
     counter = 0
      @cells.each do |token|
      if token == "O" || token == "X"
       counter += 1
     end
      end
      counter
   end

   def taken?(user_input) #cells contain "X" and "O"
     if position(user_input) == "X" || position(user_input) == "O"
      true
     else
      false
     end
   end

   def valid_move?(user_input)
      user_input.to_i.between?(1,9) && !taken?(user_input)
   end

   def update(user_input, current_player)
     @cells[user_input.to_i-1] = current_player.token
   end
end
