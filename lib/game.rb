require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # mid column
  [2,5,8], # right column
  [0,4,8], # diag 1
  [6,4,2] # diag 2
]

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.odd?
      @player_2
    else
      @player_1
    end
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def full?
    @board.cells.all? do |spot|
      spot != " "
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      won = combo.all? do |pos|
        @board.cells[pos] == "X"
      end
      if won
        return true
      end
      won = combo.all? do |pos|
        @board.cells[pos] == "O"
      end
      if won
        return true
      end
    end
    false
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      won = combo.all? do |pos|
        board.cells[pos] == "X"
      end
      if won
        return "X"
      end
      won = combo.all? do |pos|
        board.cells[pos] == "O"
      end
      if won
        return "O"
      end
    end
    nil
  end

  def turn
    if current_player.instance_of? Human
      move = current_player.move([])
      until board.valid_move?(move)
        move = current_player.move([])
      end
    elsif current_player.instance_of? Computer
      move = current_player.move(board)
    end
    board.update(move, current_player)
  end

  def play
    until over?
      turn
      @board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end