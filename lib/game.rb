require 'pry'

class Game

  attr_accessor :player_1, :player_2, :board, :token

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count(board)
    count = 0
    board.each do |turn|
      if turn == "X" || turn == "O"
      count += 1
      end
    end
    count
  end

  def current_player
    if @board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |x|
      @board.cells[x[0]] == @board.cells[x[1]] && @board.cells[x[1]] == @board.cells[x[2]] && @board.cells[x[1]] != " "
    end
  end

  def full?
    if @board.cells.include?(" ")
      return false
    else
      return true
    end
  end

  def draw?
    if won? == nil && full? == true
      return true
    elsif won?
      return false
    else
      return false
    end
  end

  def over?
    if draw? == true
      return true
    elsif won?
      return true
    else
      return false
    end
  end

  def winner
     if won? && @board.cells[won?[0]] == "X"
       player_1.token
     elsif won? && @board.cells[won?[0]] == "O"
       player_2.token
     else
       nil
     end
  end

  def turn
    player = current_player
    players_move = player.move(@board)
    if @board.valid_move?(players_move) == false
      puts "invalid move"
      turn
    else
      @board.update(players_move, player)
      @board.display
      puts "Please enter 1-9:"
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
