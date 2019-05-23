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
  [2,4,6] ]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"),board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
    puts "It's #{current_player.token}'s turn."
    @user_input = current_player.move(@board).to_i
    if @board.valid_move?(@user_input.to_s)
      board.update(@user_input, current_player)
    else
      puts "This move is invalid. Please try again"
      turn
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
