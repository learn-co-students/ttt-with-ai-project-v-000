 require 'pry'
 class Board
   attr_accessor :cells

   def initialize(cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
     @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   end

   def reset!
     if @cells.clear
       @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
     end
   end

   def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

   #def input_to_index(user_input)
    #user_input.to_i - 1
   #end

   def position(user_input)
     input = user_input.to_i - 1
     @cells[input]
   end

   def full?(cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
     if @cells.include?(' ') || @cells.include?('')
       false
     else
       true
     end
   end

   def turn_count
     x = @cells.count("X")
     o = @cells.count("O")
     x + o
   end

   def taken?(user_input)
     input = user_input.to_i - 1
     if @cells[input] != " " && @cells[input] != ""
       true
     else
       false
     end
   end

   def valid_move?(user_input)
     input = user_input.to_i - 1
     input.between?(0,8) && !taken?(user_input)

   end

   def update(user_input, player)
     input = user_input.to_i - 1
     @cells[input] = player.token
   end

 end
