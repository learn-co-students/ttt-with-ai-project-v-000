require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # First diagonal
    [2,4,6]  # Second diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    board.cells.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? player_1 : player_2
    #if even, return player_1
  end

  def over?
    #game is over if board is full or someone won
    if draw? || won?
      true
    else
      false
    end
  end

  def draw?
    !won? && full?
  end

  def full?
    board.cells.all? {|p| p == "X" || p == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |win_set|
      i1 = win_set[0]
      i2 = win_set[1]
      i3 = win_set[2]
      board_value_1 = board.cells[i1]
      board_value_2 = board.cells[i2]
      board_value_3 = board.cells[i3]

      if board_value_1 == "X" && board_value_2 == "X" && board_value_3 == "X"
        return win_set
      end
      if board_value_1 == "O" && board_value_2 == "O" && board_value_3 == "O"
        return win_set
      end
    end
    return false
  end

  def winner
    if won?
      board.cells[won?.first] == "X" ? "X" : "O"
    else
      nil
    end
  end

  def turn
    player_input = current_player.move(board)
    if board.valid_move?(player_input)
      board.update(player_input, current_player)
    else
      turn
    end
    board.display
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

  def self.start
    puts "Welcome to Tic Tac Toe!"

    game_mode = nil
    until game_mode.to_i.between?(1,3) do
      puts "What type of game would you like to play? Please enter 1-3"
      puts "1. Computer vs. Computer"
      puts "2. Player vs. Computer"
      puts "3. Two player"
      game_mode = gets.chomp
    end

    case game_mode
    when  "1"
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
    when  "2"
      input = nil
      until input.to_i.between?(1,2) do
        puts "Which player should go first as X?"
        puts "Please enter 1 for player or 2 for computer"
        input = gets.chomp
      end
      if input == "1"
        player_1 = Players::Human.new("X")
        player_2 = Players::Computer.new("O")
      else
        player_1 = Players::Computer.new("X")
        player_2 = Players::Human.new("O")
      end
    when "3"
        puts "First player will be X"
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
    end#case
    self.new(player_1, player_2).play
  end#method start
end
