require "pry"
class Game

  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |win|
      board.cells[win[0]] == board.cells[win[1]] &&
      board.cells[win[1]] == board.cells[win[2]] &&
      (board.cells[win[0]] == "X" || board.cells[win[0]] == "O")
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    puts "Please take your turn."
    input = current_player.move(board)
    if board.valid_move?(input)
       board.update(input, current_player)
       board.display
    else
      puts "That is an invalid move."
       turn
    end
  end

  def play
    until over?
      turn
    end
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
# end

def self.new_game
  puts "Welcome to Tic Tac Toe!"
  player_number
  @this_game.play
  if @this_game.over?
    puts "Would you like to play again? (yes or no)"
    user_response = gets.strip
  if user_response == "yes"
      new_game
    else
      puts "Thank you for playing!"
    end
  end
end

def self.player_number
  user_input = gets.strip
  if user_input == "0"
    @this_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
  elsif user_input == "1"
    puts "Would you like to go first and be X? (yes or no)"
    player_choice
  elsif user_input == "2"
    puts "Player 1 will be X"
    @this_game = Game.new
  else
    puts "Please enter a valid number (0, 1, 2)"
    player_number
  end
end

def self.player_choice
  new_input = gets.strip
  if new_input == "yes"
    @this_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
  elsif new_input == "no"
    @this_game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
  else
    "Please enter yes or no."
    player_choice
    end
  end
end
