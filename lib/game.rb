class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5], # Middle row
   [6,7,8], # Bottom row
   [0,4,8], # Diagonal Down Left To Right
   [2,4,6], # Diagonal Down Right To Left
   [0,3,6], # First Column
   [1,4,7], # Second Column
   [2,5,8], # Third Column
 ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ?   @player_1 : @player_2
  end

  def over?
    true if draw? || won? || @board.full?
  end

  def won?
  winning_array = nil
    WIN_COMBINATIONS.each do |option|
      winning_array = option if @board.cells[option[0]] == "X" && @board.cells[option[1]] == "X" && @board.cells[option[2]] == "X"
      winning_array = option if @board.cells[option[0]] == "O" && @board.cells[option[1]] == "O" && @board.cells[option[2]] == "O"
    end
  (winning_array != nil) ? winning_array : false
  end

  def draw?
    (@board.full? && !won?) ? true : false
  end

  def winner
    WIN_COMBINATIONS.each do |option|
      return "X" if (@board.cells[option[0]] == "X" && @board.cells[option[1]] == "X" && @board.cells[option[2]] == "X")
      return "O" if (@board.cells[option[0]] == "O" && @board.cells[option[1]] == "O" && @board.cells[option[2]] == "O")
    end
  return nil
  end

  def difficulty
  end


  def turn
    input = current_player.move(@board)
    @board.valid_move?(input) ? @board.update(input, current_player) : current_player.move(@board)
  end

  def play
    turn while !over?

    if winner == "X"
      @board.display
      puts "Congratulations X!"
    elsif winner == "O"
      @board.display
      puts "Congratulations O!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end
