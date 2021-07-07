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
      [6,4,2]
    ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @board.display
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
     @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
     @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
     @board.taken?(win_combo[0]+1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combination = won?
      @winner = @board.cells[win_combination.first]
    end
  end

  def turn
    current_move = current_player.move(@board)
    if @board.valid_move?(current_move) == true
      puts "Turn: #{@board.turn_count+1}\n"
      @board.update(current_move, current_player)
      #puts "#{current_player.token} moved #{current_move}"
      @board.display
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
