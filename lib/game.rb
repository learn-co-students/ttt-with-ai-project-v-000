require 'pry'

class Game
  include Players
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
  ]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    return @player_1 if @board.turn_count.even?
    return @player_2 if @board.turn_count.odd?
  end

  def over?
    @board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      ttt = []
      combo.each do |x|
        ttt << self.board.cells[x]
      end
      return combo if ttt.uniq.length == 1 && ttt[0] != " "
    end
    return false
  end

  def draw?
    if @board.full?
      return false if won? != false
      return true if won? == false
    end
    return false
  end

  def winner
    if won? == false
      return nil
    else
      return "#{@board.cells[won?[0]]}"
    end
  end

  def turn
    loop do
      move = current_player.move(@board)
      if @board.valid_move?(move) == true
        @board.update(move, current_player)
        puts "updated:"
        puts @board.display
        break
      end
      puts "Invalid move!"
    end
  end

  def play
    while over? == false && won? == false && draw? == false
      puts "Player 1" if current_player == @player_1
      puts "Player 2" if current_player == @player_2
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def start
    puts "Welcome to Tic-tac-toe!"
    puts "What kind of game would you like to play? 0, 1, or 2 player?"
    input = gets.chomp
    if input == "0"
      self.player_1 = Computer.new("X")
      self.player_2 = Computer.new("O")
    elsif input == "1"
      self.player_2 = Computer.new("O")
    else
      puts "Hi player 1, you're X. Please enter a number 1-9!"
    end
    play
  end
end
