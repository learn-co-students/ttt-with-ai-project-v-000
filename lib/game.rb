require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def over?
    self.draw? || self.won?
  end

  def draw?
    !self.won? && self.board.full?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
    self.board.cells[win_combination[0]] == self.board.cells[win_combination[1]] && self.board.cells[win_combination[1]] == self.board.cells[win_combination[2]] && self.board.taken?(win_combination[0])
    end
  end

  def winner #need to fix, won't return nil if false
    if won?
     win_combination = won?
     self.board.cells[win_combination[0]]
   end
  end


  def turn
  index = input_to_index(gets.chomp)
  if self.board.valid_move?(index)
    self.board.update(user_input, player)
    player_token = current_player
    self.human.move(index, player_token)
    self.board.display
  else
    turn
  end
end

  def play

  end

  def start
    
  end
end
