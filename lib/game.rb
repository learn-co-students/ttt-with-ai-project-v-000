require 'pry'

class Game

  include Players

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[6,4,2]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    elsif @board.turn_count.odd?
      @player_2
    end
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      w_1 = combo[0]
      w_2 = combo[1]
      w_3 = combo[2]

      p_1 = @board.cells[w_1]
      p_2 = @board.cells[w_2]
      p_3 = @board.cells[w_3]

      p_1 == p_2 && p_2 == p_3 && @board.taken?(w_1 + 1)
    end
  end

  def draw?
    if won?
      false
    elsif @board.full? && !won?
      true
    end
  end

  def winner
    #binding.pry
    @board.cells[won?[0]] if won?
  end

  def turn
    @board.display
    puts "Please enter 1 - 9"
    player = current_player
    move = player.move(board)
    if @board.valid_move?(move)
      @board.update(move, player)
      #@board.display
    else
      puts "Invalid move."
      turn
    end
    #binding.pry
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      @board.display
      puts "Would you like to play again? (y/n)"
      answer = gets
      if answer == "y"
        Game.start
      end
    elsif draw?
      puts "Cat's Game!"
      @board.display
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      if answer == "y"
        Game.start
      end
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "Would you like to play a 0, 1 or 2 player game? Or would you like to play wargames?!"
    input = gets.chomp
    #binding.pry
    if input == "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))

      game.play
    elsif input == "1"
     puts "Who should go first and be X?"
     puts "Enter 1 to be player 1, or 2 to be player 2."
     input_2 = gets.chomp
     if input_2 == "1"
       game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
       game.play
     elsif input_2 == "2"
       game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
       game.play
     end
   elsif input == "2"
     Game.new.play
   elsif input == "wargames"
     game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
     results = {}
     count = 100
     while count is > 0
       game.play
       count -= 1
       if game.won?
         results[won]+=1
       elsif game.draw?
         results[draw]+=1
       end
     end
     puts "Out of 100 games, there were #{results[won]} wins and #{results[draw] tie games.}"
   else
     puts "Invalid entry"
     start
    end

  end
end
