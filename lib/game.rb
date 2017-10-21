require_relative "../config/environment.rb"
require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def board
    @board
  end

  def current_player
    self.board.cells.count{|cell| cell == " "}.odd? ? @player_1 : @player_2
  end

  def over?
    draw? || won? != false ? true : false
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == "X" &&  board.cells[combo[1]] == "X" &&  board.cells[combo[2]] == "X"
         return combo
      elsif  board.cells[combo[0]] == "O" &&  board.cells[combo[1]] == "O" &&  board.cells[combo[2]] == "O"
         return combo
      else
        false
      end
    end
    return false
  end

  def draw?
    @board.full? && !won? ? true : false
  end

  def winner
    if won? != false
      combo = won?
      board.cells[combo[0]]
    else
      nil
    end
  end

  def turn
    puts "It\'s #{current_player.token}\'s move. Pick a number, 1 - 9."
    move = current_player.move(board)
    until board.valid_move?(move) #keep asking the player to make a move until they make a valid selection
      puts "Please make a valid move."
      move = current_player.move(board)
    end
    board.update(move, current_player)
    board.display
  end

  def play
    board.display
    until over?
      turn
    end
    print "Game over. "
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    else
      nil
    end
  end

end
