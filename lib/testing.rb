# class Board

# attr_accessor :cells

#   def initialize()
#     reset!
#   end

#   def reset!
#     @cells = Array.new(9, " ")
#   end

#   def display
#     puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
#     puts "-----------"
#     puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
#     puts "-----------"
#     puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
#   end

#   def full?
#     @cells.all?{|token| token == "X" || token == "O"}
#   end

#   def turn_count
#     @cells.count{|token| token == "X" || token == "O"}
#   end

#      input = [input.to_i-1]

#   def valid_move?(input)
#     input.to_i.between?(1,9) && !taken?(input)
#   end

#   def position(input)
#     @cells[input.to_i-1]
#   end

#   def taken?(input)
#     if (@cells[input.to_i-1] == "X" || @cells[input.to_i-1] == "O")
#       return true
#     else
#       return false
#     end
#   end

#   def update(input, user)
#     @cells[input.to_i-1] = user.token
#   end

# # end
# end 

# class Game

#   attr_accessor :board, :player_1, :player_2

#  WIN_COMBINATIONS = [[0, 1, 2], #top row
#  [3, 4, 5], #middle row
#  [6, 7, 8], #bottom row
#  [0, 3, 6], #left column
#  [1, 4, 7], #mid column
#  [2, 5, 8], #right column
#  [0, 4, 8], #diagonal down
#  [6, 4, 2]] #diagonal up

#   def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
#     @player_1 = player_1
#     @player_2 = player_2
#     @board = board
#   end

#   def current_player
#     board.turn_count.even? ? player_1 : player_2 
#   end

#   def over?
#     won? || draw?
#   end

#  def won?
#    WIN_COMBINATIONS.any? do |combi|
#      board.cells[combi[0]] == "X" && board.cells[combi[1]] == "X" && board.cells[combi[2]] == "X" ||
#      board.cells[combi[0]] == "O" && board.cells[combi[1]] == "O" && board.cells[combi[2]] == "O"
#    end
#  end

#  def draw?
#    !won? && board.full?
#  end

#   def winner
#    winner = nil
#    if won?
#      WIN_COMBINATIONS.any? do |combi|
#        if board.cells[combi[0]] == "X" && board.cells[combi[1]] == "X" && board.cells[combi[2]] == "X"
#          winner = "X"
#        elsif board.cells[combi[0]] == "O" && board.cells[combi[1]] == "O" && board.cells[combi[2]] == "O"
#          winner = "O"
#        end
#      end
#    end
#    winner
#   end

#   def turn
#    player = current_player 
#    action = player.move
#   if @board.valid_move?(action) 
#     @board.update(action, player)
#   else
#     turn
#   end
#   end
# #Why does input and player need to be assigned to the variables?

#   def play
#     until over?
#       turn
#     end
#     if draw?
#       puts "Cats Game!"
#     elsif won?
#       puts "Congratulations #{winner}!"
#     end
#   end

# end


# class Player < Computer 

#  attr_reader :token

#  def initialize(token)
#    @token = token
#  end

# end

# class Human < Player

#   def move(*board)
#     puts "Where would you like to move?(1-9)" # <= added
#     input = gets.chomp
#   end

# end

# class Player < Computer 

#  attr_reader :token

#  def initialize(token)
#    @token = token
#  end

# end

# board = Board.new
# game = Game.new
