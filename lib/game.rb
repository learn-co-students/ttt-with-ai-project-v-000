require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(*args)
    @player_1 = args[0] || Human.new("X")
    @player_2 = args[1] || Human.new("O")
    @board = args[2] || Board.new
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def draw?
    ( @board.full? && !won? ) ? true : false
  end

  def over?
    won?  || draw?
  end

  def won?
    WIN_COMBINATIONS.any? do |combination|
      return combination if winner_x(combination) || winner_y(combination)
    end
  end

  def winner
    sequence = won?
    sequence.is_a?(Array) ? @board.cells[sequence[0]] : nil
  end

  def winner_x(combination)
    combination.all? { |x| @board.cells[x] == "X" }
  end

  def winner_y(combination)
    combination.all? { |o| @board.cells[o] == "O" }
  end

  def turn
    puts "Please enter 1-9:"
    move = current_player.move(@board)
    @board.valid_move?(move) ? @board.update(move, current_player) : turn
  end

  def play
    until over?
      turn

      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end