require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      @board.cells[array[0]] == @board.cells[array[1]] && @board.cells[array[1]] == @board.cells[array[2]] && @board.taken?(array[0]+1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    if win_combo = won?
      @winner = @board.cells[win_combo.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if !@board.valid_move?(current_move)
      turn
    else
      @board.update(current_move, player)
      @board.display
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def play_again?
    puts "Would you like to play again?"
    input = gets.strip
    if input.downcase == "y" || input.downcase == "yes"
      true
    elsif input.downcase == "n" || input.downcase == "no"
      exit
    end
  end

  def start_0(player_1, player_2)
    @board.display
    player_1 = Players::Computer.new("X")
    player_2 = Players::Computer.new("O")
    play
  end

  def start_1(player_1, player_2)
    @board.display
    if @player_1 == "X" && @player_2 == "O"
      @player_1 = Players::Human.new("X") && @player_2 = Players::Computer.new("O")
    elsif @player_1 == "O" && @player_2 == "X"
      @player_1 = Players::Human.new("O") && @player_2 = Players::Computer.new("X")
    end
    play
  end

  def start_2(player_1, player_2)
    @board.display
    player_1 = Players::Human.new("X")
    player_2 = Players::Human.new("O")
    play
  end
end
