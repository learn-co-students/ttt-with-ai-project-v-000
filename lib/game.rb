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
    b = board.cells
    w = WIN_COMBINATIONS
    w.each do |sequence|
      if sequence.all? { |a| b[a] == 'X' }
        @winner_X_O = "X"
        @return = true
      elsif sequence.all? { |a| b[a] == 'O' }
        @winner_X_O = "O"
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
        puts "Invalid entry"
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
        puts "Invalid entry"
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
    board.display
  end

  def start
    puts "****************************************************************"
    puts "*                *** Welcome to Tic Tac Toe! ***               *"
    puts "* The board is numbered 1 to 9 starting in the top left corner *"
    puts "*  A 0 player game has two computer players playing            *"
    puts "*      against each other with no interaction from the user    *"
    puts "*  A 1 player game has a human playing against a computer      *"
    puts "*  A 2 player game has two human players                       *"
    puts "* Whoever plays first will be 'X'                              *"
    puts "****************************************************************"
    puts "Please enter 0, 1, or 2 for the type of game you wish to play   "
    puts "or enter 'exit' at any time to quit the game:"
    input = gets.strip
    case input
      when "0"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
      when "1"
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      when "2"
        Game.new(Players::Human.new("X"), Players::Human.new("O")).play
      when "exit"
        exit
      else
        puts "Invalid selection - Please try again!"
    end
  end

end
