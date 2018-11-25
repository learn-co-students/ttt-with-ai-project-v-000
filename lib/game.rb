require_relative "board"
require_relative "players/human"

class Game

  WIN_COMBINATIONS = [
  [0, 1, 2],   #top row
  [3, 4, 5],   #middle row
  [6, 7, 8],   #bottom row
  [0, 3, 6],   #left column
  [1, 4, 7],   #middle column
  [2, 5, 8],   #right column
  [0, 4, 8],   #diagonal 1
  [2, 4, 6]   #diagonal 2
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count % 2 != 0
      @player_2
    else
      @player_1
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      position1 = combo[0]
      position2 = combo[1]
      position3 = combo[2]
      if @board.cells[position1] == @board.cells[position2] && @board.cells[position3] == @board.cells[position1] && @board.taken?(position1 + 1)
        return combo
      end
    end
    false
  end

  def draw?
    if @board.full? && !self.won?
      true
    else
      false
    end
  end

  def over?
    self.draw? or self.won?
  end

  def winner
    if self.won?
      @board.cells[self.won?[0]]
    else
      nil
    end
  end

  def turn
    input = self.current_player.move(@board)
    if board.valid_move?(input)
      board.update(input, self.current_player)
    else
      self.turn
    end
  end

  def play
    while !self.over?
      puts "Player #{self.current_player.token}, please make a selection:"
      self.turn
    end
    if self.draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end
end
