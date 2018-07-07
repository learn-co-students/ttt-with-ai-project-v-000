require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2, :winner

  #Define WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |winner|
      @board.cells[winner[0]] == @board.cells[winner[1]] && @board.cells[winner[1]] == @board.cells[winner[2]] && @board.taken?(winner[0]+1) #board.cells[winner[0]] != " "
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winXO = won?
      @winner = @board.cells[winXO.first]
    end
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
      @board.display
    elsif input.to_i.between?(1,9). == false
      puts "Sorry, invalid move...try again"
      turn
    else
      puts "Seat's taken...try again"
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def start
    puts "Which type of game would you like to play, 0, 1 or 2 player...or wargames?"
    input = gets.strip
    if input == "wargames" || input == "Wargames" || input == "wg"
      @games_won = 0
      100.times do
        if @game.won?
          @games_wons += 1
        end
      end
      puts "Woo hoo! The game has been won #{@games_wons} times!"
    elsif input == 0
      @game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      @game.turn
    elsif input == 1
      puts "Who should play first, Human or Computer?"
      input = gets.strip
      if input == "Human" || input == "human" || input == "h"
        @game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        #@game.turn
      else
        @game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @game.turn
      end
    elsif input == 2
      @game = Game.new
      @game.turn
    else
      start
    end

    if @game.over == true
      puts "Would you like to play again?"
      input = gets.strip
      if input == "yes"
        start
      else
        puts "Later gator!"
        exit
      end
    end
  end
end
