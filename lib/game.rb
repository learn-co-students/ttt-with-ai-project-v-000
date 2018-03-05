# require 'pry'
# class Game
#   attr_accessor :board, :player_1, :player_2
#
#   WIN_COMBINATIONS = [
#     [0,1,2],
#     [3,4,5],
#     [6,7,8],
#     [0,3,6],
#     [1,4,7],
#     [2,5,8],
#     [0,4,8],
#     [6,4,2]
#   ]
#
#   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
#     @player_1 = player_1
#     @player_2 = player_2
#     @board = board
#   end
#
#
# def current_player
#   @board.turn_count % 2 == 0? @player_1 : @player_2
#   # if self.turn_count % 2 == 0
#   #   @player_1
#   # else
#   #   @player_2
#   # end
# end
#
# def over?
#   won? || draw?
# end
#
# def won?
#   WIN_COMBINATIONS.detect do |combo|
#     @board.cells[combo[0]] == @board.cells[combo[1]] &&
#     @board.cells[combo[1]] == @board.cells[combo[2]] &&
#     @board.taken?(combo[0] + 1)
#   end
# end
#
# def draw?
#   !won? && over? ? true : false
# end
#
# def winner
#   if !self.won?
#     nil
#   elsif @board.cells[self.won?[0]] == "X"
#     "X"
#   else
#     "O"
#   end
# end
#
# def turn
#   current_move = current_player.move(@board)
#   if @board.valid_move?(current_move)
#     @board.update(current_move, current_player)
#   else
#     turn
#   end
# end
#
# def play
#   while !over?
#     turn
#   end
#   if won?
#     puts "Congratulations #{winner}"
#   elsif draw?
#     puts "Cat's Game!"
#   end
# end
#
#
# #
# # def play(board)
# #   until over?(board)
# #     turn(board)
# #   end
# #   if won?(board)
# #     puts "Congratulations #{winner(board)}!"
# #   elsif draw?(board)
# #     puts "Cat's Game!"
# #   end
# # end
# #
#
# end


class Game
  attr_reader :board, :player_1, :player_2
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
  def board=(board)
    @board = board
  end
  def player_1=(p1)
    @player_1 = p1
  end
  def player_2=(p2)
    @player_2 = p2
  end
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1=(player_1)
    @player_2=(player_2)
    @board=(board)
  end
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  def over?
    won? || draw?
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end
  def draw?
    @board.full? && !won?
  end
  def winner
    if !self.won?
      nil
    elsif @board.cells[self.won?[0]] == "X"
      "X"
    else
      "O"
    end
  end
  def turn
    current_move = current_player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, current_player)
    else
      turn
    end
  end
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
