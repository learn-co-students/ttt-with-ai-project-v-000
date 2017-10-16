require 'pry'

class Game

  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board
    @board
  end

  def player_1
    @player_1
  end

  def player_2
    @player_2
  end

  def current_player
    counter = 0
    @board.cells.each {|x| counter += 1 if x == "X" || x == "O"}
    counter
    counter % 2 == 0 ? player_1 : player_2
  end

  def next_player
    counter = 1
    @board.cells.each {|x| counter += 1 if x == "X" || x == "O"}
    counter
    counter % 2 == 0 ? player_2 : player_1
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      @board.cells[array[0]] == @board.cells[array[1]] &&
      @board.cells[array[1]] == @board.cells[array[2]] &&
      @board.taken?(array[0] + 1)
    end
  end

  def draw?
    @board.cells.all? {|x| x == "X" || x == "O"} && !won?
  end

  def winner
    if won?
      @board.cells[won?[0]]
    end
  end

  def turn
    player = current_player

    the_move = player.move(@board)

    if @board.valid_move?(the_move)
      @board.update(the_move, player)
      @board.display
      puts "\n"
      puts "It's your turn #{next_player.token}! Make a move!\n\n"
    else
      turn
    end
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

end
