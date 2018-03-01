require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  extend Players


  WIN_COMBINATIONS = [
    [0,1,2], # Horizontal Top Row
    [3,4,5], # Horizontal Middle Row
    [6,7,8], # Horizontal Bottom Row
    [0,3,6], # Vertical Left Row
    [1,4,7], # Vertical Middle Row
    [2,5,8], # Vertical Right Row
    [0,4,8], # Backward Slash
    [2,4,6] # Forward Slash
  ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.cells.count("X") <= @board.cells.count("O")
      @player_1
    else
      @player_2
    end
  end

  def over?
    if draw? == true
      true
    elsif won? != false
      true
    else
      false
    end
  end

  def won?
    if (@board.cells[0] == "X" && @board.cells[1] == "X" && @board.cells[2] == "X") || (@board.cells[0] == "O" && @board.cells[1] == "O" && @board.cells[2] == "O")
      return WIN_COMBINATIONS[0]
    elsif (@board.cells[3] == "X" && @board.cells[4] == "X" && @board.cells[5] == "X") || (@board.cells[3] == "O" && @board.cells[4] == "O" && @board.cells[5] == "O")
      return WIN_COMBINATIONS[1]
    elsif (@board.cells[6] == "X" && @board.cells[7] == "X" && @board.cells[8] == "X") || (@board.cells[6] == "O" && @board.cells[7] == "O" && @board.cells[8] == "O")
      return WIN_COMBINATIONS[2]
    elsif (@board.cells[0] == "X" && @board.cells[3] == "X" && @board.cells[6] == "X") || (@board.cells[0] == "O" && @board.cells[3] == "O" && @board.cells[6] == "O")
      return WIN_COMBINATIONS[3]
    elsif (@board.cells[1] == "X" && @board.cells[4] == "X" && @board.cells[7] == "X") || (@board.cells[1] == "O" && @board.cells[4] == "O" && @board.cells[7] == "O")
      return WIN_COMBINATIONS[4]
    elsif (@board.cells[2] == "X" && @board.cells[5] == "X" && @board.cells[8] == "X") || (@board.cells[2] == "O" && @board.cells[5] == "O" && @board.cells[8] == "O")
      return WIN_COMBINATIONS[5]
    elsif (@board.cells[0] == "X" && @board.cells[4] == "X" && @board.cells[8] == "X") || (@board.cells[0] == "O" && @board.cells[4] == "O" && @board.cells[8] == "O")
      return WIN_COMBINATIONS[6]
    elsif (@board.cells[2] == "X" && @board.cells[4] == "X" && @board.cells[6] == "X") || (@board.cells[2] == "O" && @board.cells[4] == "O" && @board.cells[6] == "O")
      return WIN_COMBINATIONS[7]
    else
      false
    end
  end

  def draw?
    if won? == false && @board.cells.include?(" ") == false
      true
    else
      false
    end
  end

  def winner
    if won? == false
      nil
    elsif @board.cells[won?[0]] == "X"
      player_1.token
    else
      player_2.token
    end
  end

  def turn
    move_value = current_player.move(@board)
    if @board.update(move_value, current_player) == false
      current_player.move(@board)
    else
      @board.update(move_value, current_player)
    end
  end

  def play
    @board.display
    while over? == false
      turn
      @board.display
    end
    if winner == nil
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
