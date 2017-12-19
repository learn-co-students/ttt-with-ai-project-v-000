require './lib/player.rb'


class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if combo.all? { |token| board.cells[token] == "X"}
      return combo if combo.all? { |token| board.cells[token] == "O"}
    end
    false
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? board.cells[won?.last] : nil
  end

  def turn
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player)
      board.display
    else
      puts "Invalid move."
      self.turn
    end
  end

  def play
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

  def start
    puts "- - - - - - - - - - - - ".colorize(:light_green)
    puts "Welcome to Tic Tac Toe!".colorize(:white)
    puts "- - - - - - - - - - - - ".colorize(:light_green)
    puts "Select Player Mode:".colorize(:white)
    puts "0 - Computer VS Computer".colorize(:green)
    puts "1 - Human VS Computer".colorize(:cyan)
    puts "2 - Human VS Human".colorize(:yellow)

    input = gets.strip.to_i
    if input == 0
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
      game.play
    elsif input == 1
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
      game.play
    elsif input == 2
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
      game.play
    end
  end

end
