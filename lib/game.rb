require_relative "../lib/players/human.rb"
require_relative "../lib/players/computer.rb"
require_relative "../lib/board.rb"

class Game
  extend Players

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def won?
    combo_x = board.cells.map.with_index { |x, i|
        i if x == "X"
    }.compact

    combo_o = board.cells.map.with_index { |o, i|
        i if o == "O"
    }.compact

    WIN_COMBINATIONS.find { |combo|
      (combo_x & combo).size == 3 || (combo_o & combo).size == 3
    }
  end

  def draw?
     !won? && board.full? ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    won? ? board.position(won?.last + 1) : nil
  end

  def turn
    player = current_player
    current_move = player.move(board)

    if board.valid_move?(current_move)
      puts "Turn: #{@board.turn_count + 1}"
      puts "Please enter 1-9:"
      board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      board.display
    else
      turn
    end
  end

  def play
    while !over?
      turn
    end

    case winner
      when "X"
        puts "Congratulations X!"
      when "O"
        puts "Congratulations O!"
      when nil
        puts "Cat's Game!"
    end
  end
end
