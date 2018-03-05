require 'pry'

class Game





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

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end

  def over?
    if won?
      true
    elsif draw?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      win.all? {|w| board.cells[w] == "X"} || win.all? {|w| board.cells[w] == "O"}
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    input = self.current_player.move(board)
    if !board.valid_move?(input)
      puts "invalid."
      puts "Please choose where you want to go 1-9:"
      turn
    else
      board.update(input, current_player)
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end




end
