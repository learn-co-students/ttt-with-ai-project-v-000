require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.turn_count.even? ? self.player_1 : self.player_2
  end

  def over?
    self.board.full? || self.won?
  end

  def won?
    won = WIN_COMBINATIONS.detect do |wc|
      (self.board.cells[wc[0]] == "X" &&
       self.board.cells[wc[1]] == "X" && 
       self.board.cells[wc[2]] == "X") || 
      (self.board.cells[wc[0]] == "O" &&
       self.board.cells[wc[1]] == "O" && 
       self.board.cells[wc[2]] == "O")
    end
    !won.nil?
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    won = WIN_COMBINATIONS.detect do |wc|
      (self.board.cells[wc[0]] == "X" &&
       self.board.cells[wc[1]] == "X" && 
       self.board.cells[wc[2]] == "X") || 
      (self.board.cells[wc[0]] == "O" &&
       self.board.cells[wc[1]] == "O" && 
       self.board.cells[wc[2]] == "O")
    end
    if !won.nil?
      self.board.cells[won[0]]
    end
  end

  def turn
    a = self.current_player.move(self.board)
    if !self.board.valid_move?(a)
      puts "Sorry that move isn't vaild."
      self.turn
    else
      self.board.update(a, self.current_player)
      self.board.display
    end
  end

  def play
    self.board.display
    
    until self.over?
      self.turn
      if self.draw?
        break
      end
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cats Game!"
    end
  
  end




end