# require 'pry'
#
# class Board
#   attr_accessor :cells
#
# # Tech Coach Jennifer Pazos added 'board.reset!' to the test as a workaround
# # Spent around five total hours on this error, including Tech Coach time:
# # #initialize -- sets the cells of the board to a 9 element array of " "
#   def initialize
#     reset!
#
#   end
#
#   def reset!
#     @cells = Array.new(9, " ")
#   end
#
#   def display
#     puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
#     puts "-----------"
#     puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
#     puts "-----------"
#     puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
#   end
#
#   def full?
#     @position.each_index do |position|
#       if !position(position.to_i)
#         true
#       else
#         false
#       end
#     end
#   end
#   # def full?
#   #   !@board.include?(" ")
#   # end
#   #
#   # def full?
#   #   cells.all?{|token| token == "X" || token == "O"}
#   # end
#
#   def turn_count
#     cells.count{|token| token == "X" || token == "O"}
#   end
#
#   def valid_move?(input)
#     input.to_i.between?(1,9) && !taken?(input)
#   end
#
#   def update(input, player)
#     cells[input.to_i-1] = player.token
#   end
#
#   def position(input)
#     cells[input.to_i-1]
#   end
#
#   def taken?(input)
#     !(position(input) == " " || position(input) == "")
#   end
# end
#
# # class Board
# #   attr_accessor :cells
# #
# #   def initialize
# #   #   binding.pry
# #   # # @cells = Array.new(9, " ") # This is duplicate code in the reset! method
# #   #
# #   # reset! # Calling this doesn't pass the test
# #   @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] # this did not work either
# #
# #   end
# #
# #   def reset!
# #     @cells = Array.new(9, " ")
# #      #binding.pry
# #
# #   end
#
#
# # class Board
# #   attr_accessor :cells
# #
# #   def initialize()
# #     reset!
# #   end
# #
# #   def reset!
# #     @cells = Array.new(9, " ")
# #   end
# #
# #
# #
# #   def display
# #     puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
# #     puts "-----------"
# #     puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
# #     puts "-----------"
# #     puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
# #   end
# #
# #   def full?
# #     cells.all?{|token| token == "X" || token == "O"}
# #   end
# #
# #   # def full?
# #   #   !@board.include?(" ")
# #   # end
# #
# #   def turn_count
# #     cells.count{|token| token == "X" || token == "O"}
# #   end
# #
# #   def valid_move?(space)
# #       (0..8).include?(space) && space_available?(space)
# #   end
# #   # def valid_move?(input)
# #   #   input.to_i.between?(1,9) && !taken?(input)
# #   # end
# #
# #   def update(input, player)
# #     cells[input.to_i] = player.token
# #   end
# #
# #   def position(input)
# #     cells[input.to_i]
# #   end
# #
# #   def taken?(input)
# #     !(position(input) == " " || position(input) == "")
# #   end
# #
# #
# # end
# # Board.new
# # Tech Coach Jennifer Pazos added the solution (below) from GitHub and still got same behavior
