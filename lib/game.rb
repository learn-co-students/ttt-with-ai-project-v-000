require "pry"
class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 4, 6],
  [2, 5, 8],
  [3, 4, 5],
  [6, 7, 8]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.cells[combo[0]] != " "
    end
  end
    #WIN_COMBINATIONS.any? do |combo|
    #  if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
    #     combo
    #  end



  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    @board.cells[won?[0]] if won?
    if combo = won?
      @board[combo[0]]
    end
  end

  def start
    input = ""
    while input != "exit"
      puts "Welcome to Tic-Tac-Toe!"
      puts "What kind of game do you want to play? 0, 1 or 2 player"
      input = gets.strip
      case input
        when "0"
          player = Players::Computer.new(input)
        when "1"
          player_1 = Players::Human.new
          player_2 = Players::Computer.new(input)
        when "2"
          player_1 = Players::Human.new
          player_2 = Players::Human.new
      end
      puts "Who would like to go first and be the X player?"
        input = gets.strip
      case input
        when "X"
          player_1
        when "0"
          player_2
      end
    end
  end

  def turn
    puts "It's #{current_player} turn. Please enter a number from 1 - 9."
    input = current_player.move(board).to_i
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    else input.between?(1, 9) == false
      puts "OOPs. Please try again. That is an invalid move."

    input = ""
    puts "Please enter number 1- 9"
    input = gets.strip
    if @board.valid_move?(input)
      @board.update(input, player)
      @board.current_player
    else
      turn
    end
    @board.display
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end

=begin
def turn
  puts "Please enter a number from 1 - 9"
  input = gets.strip
  position(input)
  if valid_move?(input)
    update(input, player)
  else
    turn
  end
end
end
=end
