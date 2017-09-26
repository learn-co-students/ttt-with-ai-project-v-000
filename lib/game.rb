require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],   # Bottom row
  [0,3,6],    # Left column
  [1,4,7],     # Middle column
  [2,5,8],      # Right column
  [0,4,8],       # Left diagonal
  [2,4,6]         # Right diagonal
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position_1 = board.cells[combo[0]]
      position_2 = board.cells[combo[1]]
      position_3 = board.cells[combo[2]]
      #binding.pry
      position_1 == position_2 && position_2 == position_3 && position_1 != " "
    end
  end

  def draw?
    if @board.full? && !won?
      true
    end
  end

  def over?
    if won? || draw? || @board.full?
      return true
    end
  end

  def winner
    if winning_combo = won?
      board.cells[winning_combo.first]
    end
  end

  def turn
    #binding.pry
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
    else
      turn
    end
    board.display
  end

  def play
    until over?
      turn
    end
    if won?
       puts "Congratulations #{winner}!"
    elsif draw?
       puts "Cat's Game!"
    end
  end

  def start_game
    puts "Welcome to the extra special version of Tic-Tac-Toe!"
    puts "What type of game would you like to play?"
    puts "0, 1, or 2 player? Type '0', '1', or '2'."
    input = gets.chomp
      if input == '0'
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Computer.new("O")

        Game.new(@player_1, @player_2, board).play

      elsif input == '1'
        puts "Would you like to go first as 'X'? Type 'yes' or 'no'."
        input_2 = gets.chomp
        if input_2 == 'yes'
          @player_1 = Players::Human.new("X")
          @player_2 = Players::Computer.new("O")

          Game.new(@player_1, @player_2, board).play
        elsif input_2 == 'no'
          @player_1 = Players::Computer.new("O")
          @player_2 = Players::Human.new("X")

          Game.new(@player_1, @player_2, board).play
        end
      elsif input == '2'
        puts "Okay! Player 1 will be 'X' and Player 2 will be 'O'. Lets start!"

        Game.new.play

      elsif input == "wargames"
        @game_count = 0
        100.times do
          puts "We're on game ##{@game_count}."
          @player_1 = Players::Computer.new("X")
          @player_2 = Players::Computer.new("O")
          Game.new(@player_1, @player_2).play
          @game_count +=1
        end

      else
        puts "Invalid response. Please type '0', '1', or '2'."
      end
      puts "Would you like to play again?"
      input = gets.chomp
        if input == "yes"
          start_game
        else
          exit!
        end


    end #end of start_game







end
