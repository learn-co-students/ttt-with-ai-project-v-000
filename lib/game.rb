require_relative "./player.rb"
require_relative './players/computer.rb'
require_relative './players/human.rb'
require_relative './board.rb'
require 'pry'

class Game
  extend Players
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count%2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_pos1 = win_combo[0]
      win_pos2 = win_combo[1]
      win_pos3 = win_combo[2]

      board_pos1 = @board.cells[win_pos1]
      board_pos2 = @board.cells[win_pos2]
      board_pos3 = @board.cells[win_pos3]

      if (board_pos1 == "X" && board_pos2 == "X" && board_pos3 == "X") ||
        (board_pos1 == "O" && board_pos2 == "O" && board_pos3 == "O")
        return [win_pos1, win_pos2, win_pos3]
      end
    end
    return false
  end

  def draw?
    @board.full? && (@board.cells.all?{|cell| @board.taken?(cell)}) && !self.won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    !self.won? ? nil : @board.cells[self.won?[0]]
  end

  def turn
      valid = false
      while !valid
        input = self.current_player.move(@board)
        valid = @board.valid_move?(input)
        if valid
           @board.update(input, self.current_player)
           @board.display
        else
          puts "Position already taken or invalid input. Try again!"
        end
      end
  end

  def play
    while !self.over?
      self.turn
    end

    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

end
