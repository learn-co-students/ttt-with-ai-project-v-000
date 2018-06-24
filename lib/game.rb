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

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def draw?
    self.board.full? && !self.won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.each {|element|
      if (self.board.cells[element[0]] == "X" && self.board.cells[element[1]] == "X" && self.board.cells[element[2]] == "X") || (self.board.cells[element[0]] == "O" && self.board.cells[element[1]] == "O" && self.board.cells[element[2]] == "O")
        return true
      end
    }
      return false
  end

  def over?
    self.draw? || self.won? ? true : false
  end

  def draw?
    self.board.full? && !self.won? ? true : false
  end

  def winner
    WIN_COMBINATIONS.each {|element|
      if self.board.cells[element[0]] == "X" && self.board.cells[element[1]] == "X" && self.board.cells[element[2]] == "X"
        return "X"
      elsif self.board.cells[element[0]] == "O" && self.board.cells[element[1]] == "O" && self.board.cells[element[2]] == "O"
        return "O"
      end
    }
      return nil
  end

  def turn
    player = current_player
    position = player.move(self.board)

    while !self.board.valid_move?(position) do
      puts "Invalid move! Try again." if player.instance_of? Human
      position = player.move(self.board)
    end

      self.board.update(position, player)
      self.board.display
  end

  def play
    until over?
      turn
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cats Game!"
    end
  end

end