require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

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

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      (@board.cells[win_combination[0]] == "X" && @board.cells[win_combination[1]] == "X" && @board.cells[win_combination[2]] == "X") || (@board.cells[win_combination[0]] == "O" && @board.cells[win_combination[1]] == "O" && @board.cells[win_combination[2]] == "O")
    end
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if !won?
      return nil
    elsif @board.cells[won?[0]] == "X"
      "X"
    elsif @board.cells[won?[0]] == "O"
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
      board.display
    else
      turn
    end
  end

  def play
    while !over? do
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    else draw?
      puts "Cats Game!"
    end
  end

  def start
    # greet the user
    puts "❌⭕️❌⭕️❌⭕️❌⭕️❌⭕️❌⭕️"
    puts "Welcome to TicTacToe!"
    puts "❌⭕️❌⭕️❌⭕️❌⭕️❌⭕️❌⭕️"
    # ask the user how many players
    puts "Please select the number of players"
    puts "0 = Computer vs. Computer"
    puts "1 = Computer vs. Human"
    puts "2 = Human vs. Human"

    input = gets.strip

      if input == "0"
        puts "Computer vs Computer..."
        Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
      elsif input == "1"
        puts "Computer vs Human..."
        puts "Type 'X' to be player 1. Type 'O' to be player 2."
        human_input = gets.strip.upcase
        if human_input == "X"
          Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
        else
          Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
        end
      elsif input == "2"
        puts "Human vs Human..."
        Game.new(Players::Human.new("X"), Players::Human.new("O")).play
      else
        puts "Not sure what you want, type 0,1,2"
        start
      end
    end
end
