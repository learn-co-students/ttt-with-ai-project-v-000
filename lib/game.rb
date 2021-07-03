require 'pry'


class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]


  def initialize(player_1 = Players::Human.new("X"), player_2= Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.odd?
      player_2
    else player_1
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |wc|
      board.cells[wc[0]] == board.cells[wc[1]] &&
      board.cells[wc[1]] == board.cells[wc[2]] &&
      (board.cells[wc[0]] == "X" || board.cells[wc[0]] == "O")
    end
  end

  def draw?
    if board.full? && !won?
      true
    else false
    end
  end

  def over?
    if draw? || won?
      true
    else false
    end
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    input = current_player.move(board)
    if !board.valid_move?(input)
      turn
    else board.update(input, current_player)
    end
  end

  def play

    until won? || draw? || over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end









# class Game
#   attr_accessor :board, :player_1, :player_2
#
#   WIN_COMBINATIONS = [
#     [0,1,2],
#     [3,4,5],
#     [6,7,8],
#     [0,3,6],
#     [2,5,8],
#     [1,4,7],
#     [0,4,8],
#     [6,4,2]
#   ]
#
#   def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
#     @player_1 = player_1
#     @player_2 = player_2
#     @board = board
#   end
#
#   def current_player
#     if @board.turn_count.odd?
#       player_2
#     else player_1
#     end
#   end
#
#   def draw?
#     board.full? && !self.won?
#   end
#
#   def over?
#     self.draw? || self.won?
#   end
#
#   def won?
#       WIN_COMBINATIONS.detect { |combo|
#         (@board.cells[combo[0]] == @board.cells[combo[1]]) && (@board.cells[combo[0]] == @board.cells[combo[2]]) && board.taken?(combo[0]+1)
#       }
#     end
#
#
#   def winner
#     if won? != nil
#       return @board.cells[won?[0]]
#     end
#   end
#
#   def turn
#     input = current_player.move(board)   #current_player refs Players module to move, which uses gets
#     if @board.valid_move?(input) #if valid move then need to update the board
#       @board.update(input, current_player)
#       @board.display
#     else turn
#     end
#   end
#
#   def play
#     until won? || draw? || over?
#       puts "Please enter a number from 1-9."
#       turn
#     end
#     if won?
#       puts "Congratulations #{winner}!"
#     elsif draw?
#       puts "Cat's Game!"
#     end
#   end
#
#   def playagain
#     puts "Would you like to play again? (yes/no)"
#     again = gets.strip
#     if again == "yes"
#       play
#     elsif again == "no"
#       puts "Goodbye!"
#     end
#   end
#
#
#
# end
