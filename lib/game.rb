require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @winner_X_O = ""
  end

  WIN_COMBINATIONS =
    [
      [0,1,2], # top row
      [3,4,5], # middle row
      [6,7,8], # bottom row
      [0,3,6], # left column
      [1,4,7], # middle column
      [2,5,8], # right columnlib
      [0,4,8], # left diagonal
      [2,4,6]  # right diagonal
    ]

  def current_player
    if board.turn_count % 2 == 0
      @curr_token = player_1.token
    else
      @curr_token = player_2.token
    end
  end

  def over?
    if won? || board.full? || draw?
      true
    else
      false
    end
  end

  def draw?
    if won? || !board.full?
      false
    else
      true
    end
  end

  def won?
    @return = false
    WIN_COMBINATIONS.each do | win_combo |
      if ((board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X") ||
          (board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"))
          @winner_X_O = board.cells[win_combo[0]]
          @return = true
      end
    end
    @return
  end

  def winner
    if won?
      @winner_X_O
    end
  end

  def turn
    current_player
    if @curr_token == "X"
      puts "Player 'X' please enter 1-9:"
      @move = player_1.move(board)
      if @move == "exit"
        exit
      end
      if !board.valid_move?(@move)
        turn
      else
        board.update(@move, player_1)
        @move
      end
    else
      puts "Player 'O' please enter 1-9:"
      @move = player_2.move(board)
      if @move == "exit"
        exit
      end
      if !board.valid_move?(@move)
        turn
      else
        board.update(@move, player_2)
        @move
      end
    end
  end

  def play
    until over?
      board.display
      turn
    end
    if won?
      puts "Congratulations #{@winner_X_O}!"
    elsif draw?
      puts "Cat's Game!"
    end
    puts "Do you wish to play again? 'y' or 'n'"
    input = gets.strip
    if input == "y"
      start
    else
      exit
    end
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "The board is numbered 1 to 9 starting in the top left corner"
    puts " 0 player game has two computer players playing against each other with no interaction from the user"
    puts " 1 player game has a human(player1) playing against a computer(player2)"
    puts " 2 player game has two human players"
    puts "Whoever plays first will be 'X'"
    puts "Please select 0, 1, or 2 for the type of game you wish to play"
    puts "or enter 'exit at any time to quit the game:"
    input = ""
    while input != "exit"
      input = gets.strip
      if input == "exit"
        exit
      end
      case input
        when "0"
          Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        when "1"
          Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        when "2"
          Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      end
      play
    end
  end

end
