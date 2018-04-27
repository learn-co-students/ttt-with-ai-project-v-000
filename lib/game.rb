require 'pry'
class Game

  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
    end
  end

  def draw?
    !won? && @board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if outcome = won?
      @board.cells[outcome[0]]
    end
  end

  def turn
    input = self.current_player.move(@board)
    if !@board.valid_move?(input)
      self.turn
    end
    @board.update(input, self.current_player)
    @board.display
  end

  def play
    until self.over?
      self.turn
    end
    won? ? (puts "Congratulations #{self.winner}!") : (puts "Cat's Game!")
  end

  def play_again?
    puts "Would you like to play again (Y/N):"
    input = gets.strip.upcase
    if input == "Y" || input == "YES"
      Game.start
    else
      puts "Thanks for playing!!!"
    end
  end

  def self.start
    puts "Welcome to Tic-Tac-Toe!"
    puts "How many players? (0-2):"
    player_count = gets.strip.to_i

    case player_count
    when 0
      first_player = Players::Computer.new("X")
      second_player = Players::Computer.new("O")
      board = Board.new
      game = Game.new(first_player, second_player, board)
      board.display
      game.play
      game.play_again?
    when 1
      first_player = Players::Human.new("X")
      second_player = Players::Computer.new("O")
      board = Board.new
      game = Game.new(first_player, second_player, board)
      board.display
      game.play
      game.play_again?
    when 2
      first_player = Players::Human.new("X")
      second_player = Players::Human.new("O")
      board = Board.new
      game = Game.new(first_player, second_player, board)
      board.display
      game.play
      game.play_again?
    end
  end
end
