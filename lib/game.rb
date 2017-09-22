require 'pry'

class Game

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

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1=nil, player_2=nil, board=nil)
    @board    = board || Board.new
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      if (board.taken?(combo[0]) && board.cells[combo[0]] &&
        board.cells[combo[0]] == board.cells[combo[1]] &&
        board.cells[combo[1]] == board.cells[combo[2]])
        return combo
      end
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    input = current_player.move(board)

    if board.valid_move?(input)
      board.update(input, current_player)
      puts board.turn_count
    else
      puts "invalid"
      turn
    end
  end

end
