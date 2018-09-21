require 'pry'
class Game

attr_accessor :board, :player_1, :player_2
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

def self.start
  input = ""
  puts "Welcome to Tic Tac Toe!"
  puts "How many people are playing today? Please type '0, 1, or 2'."
  input = gets.strip
  #if token is X, player 1 would be X and player 2 would be O
  case input
  when "0"
    player_1 = Players::Computer.new("X")
    player_2 = Players::Computer.new("O")

  when "1"
    first_or_second = ""
    puts "Would you like to go first?"
    first_or_second = gets.strip
    if first_or_second.downcase == "yes" || first_or_second.downcase == "y"
      player_1 = Players::Human.new("X")
      player_2 = Players::Computer.new("O")
    else
      player_1 = Players::Computer.new("X")
      player_2 = Players::Human.new("O")
    end

  when "2"
    player_1 = Players::Human.new("X")
    player_2 = Players::Human.new("O")
  end

    game = Game.new(player_1, player_2)
    until game.over?
    game.play
    end

    play_again = ""
      puts "Would you like to play again?"
      play_again = gets.strip
      until play_again.downcase == "n" || play_again.downcase == "no"
        game = Game.new
        until game.over?
        game.play
        end
        puts "One more time! C'mon!"
        play_again = gets.strip
      end
      puts "Thanks for playin! See you soon!"
end


def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else @player_2
  end
end


def won?
  WIN_COMBINATIONS.detect do |win_combination|
    position_1 = @board.cells[win_combination[0]]
    position_2 = @board.cells[win_combination[1]]
    position_3 = @board.cells[win_combination[2]]
    position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end


def draw?
  @board.full? && !won?
end

def over?
  won? || draw?
  end


  def winner
    if winning_combo = won?
      @winner = @board.cells[winning_combo.first]
    end
  end

def turn
  player = current_player
  current_move = player.move(@board)
if !@board.valid_move?(current_move)
  turn
else
  puts "Turn: #{@board.turn_count + 1}\n"
  @board.display
  @board.update(current_move, player)
  puts "#{player.token} moved #{current_move}"
  @board.display
  puts "\n\n"
  end
end

def play
   while over? == false
     turn
    end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw? && over?
          puts "Cat's Game!"
      end
  end
####class end below####
end


"here's a draw game so you don't have to keep figuring it out: 519328647"
