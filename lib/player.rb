class Player

  attr_accessor :board

 def initialize(token = "X")
   @token = token
 end

 def token
   @token
 end

 def input
   puts "enter 1-9"
   number = gets.strip
   if board.valid_move?(number)
     return number
   end
 end





 end
