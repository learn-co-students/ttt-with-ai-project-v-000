require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :token

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def initialize(player_1= Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  def current_player
    (@board.turn_count%2 == 0)? @player_1: @player_2
  end
  def over?
    won? || draw?
  end
  def won?
    WIN_COMBINATIONS.find do |win_combination|
      index_0 = win_combination[0]
      index_1 = win_combination[1]
      index_2 = win_combination[2]
        (@board.cells[index_0] == "X" && @board.cells[index_1] == "X" && @board.cells[index_2] == "X") ||
        (@board.cells[index_0] == "O" && @board.cells[index_1] == "O" && @board.cells[index_2] == "O")
      end
    end
  def draw?
    !won? && @board.full?
  end
  def winner
    (won?)? @board.cells[won?[0]]: nil
  end
  def turn
      # binding.pry
      input = current_player.move(@board)
      if @board.valid_move?(input)
        @board.update(input, current_player)
        @board.display
      else
        puts "invalid"
        turn
      end
  end
  def play
    until over?
      turn
    end
      if winner
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end

  #/////////////////////starting the game //////////////
  def start
    input = gets.strip.to_i

    # unless input==1||2||3
    #   puts "Invalid entry. Try entering the given option numbers - 1, 2 or 3."
    #   start
    # end


    if input == 1
        puts "You have chosen Option 1: 2 Computer players."
        puts "Let the game begin!!"
        Board.new.display
        game = Game.new(player_1= Players::Computer.new("X"), player_2= Players::Computer.new("O"))
        game.play
      elsif input == 2
        puts "You have chosen Option 2: 1 player."
        puts "Who would you like to go first - you or the computer? For yourself, type 1. For computer, type 2."
        turn = gets.strip.to_i
        puts "Would you like to be X or O?"
        token = gets.strip.downcase
        puts "Let the game begin!!"
        Board.new.display
          if turn == 1 && token == "x"
            game = Game.new(player_1= Players::Human.new("X"), player_2= Players::Computer.new("O"))
            game.play
          elsif turn == 1 && token == "o"
            game = Game.new(player_1= Players::Human.new("O"), player_2= Players::Computer.new("X"))
            game.play
          elsif turn == 2 && token == "x"
            game = Game.new(player_1= Players::Computer.new("O"), player_2= Players::Human.new("X"))
            game.play
          elsif turn == 2 && token == "o"
            game = Game.new(player_1= Players::Computer.new("X"), player_2= Players::Human.new("O"))
            game.play
          end
      elsif input == 3
        puts "You have chosen Option 3: 2 Human players."
        puts "Would you like to be Player 1 or 2? For Player 1, type 1. For Player 2, type 2."
        turn = gets.strip.to_i
        puts "Would you like to be X or O?"
        token = gets.strip.downcase
        puts "Let the game begin!!"
        Board.new.display
          if turn == 1&& token == "x"
            # binding.pry
            game = Game.new(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"))
            game.play
          elsif turn == 1 && token == "o"
            game = Game.new(player_1= Players::Human.new("O"), player_2= Players::Human.new("X"))
            game.play
          elsif turn == 2 && token == "x"
            game = Game.new(player_1= Players::Human.new("O"), player_2= Players::Human.new("X"))
            game.play
          elsif turn == 2 && token == "o"
            game = Game.new(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"))
            game.play
          end
        end

        # puts "Invalid entry. Try entering the given option numbers - 1, 2 or 3."
        # start
      # end
          #//////////////START ANOTHER GAME//////////////////
          # puts "Would you like to play another game?"
          # puts "Type Y for YES, N for NO"
          # replay = gets.strip.downcase
          # if replay == "y"
          #   Game.new.start
          # elsif replay == "n"
          #   puts "Good-bye. See you soon!"
          # end
    end

end
