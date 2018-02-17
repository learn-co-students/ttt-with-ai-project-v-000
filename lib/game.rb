require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [6,7,8],
    [0,3,6],
    [0,1,2],
    [3,4,5],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

def current_player
  @board.turn_count % 2 == 0 ? @player_1 : @player_2
end

  def over?
    draw? || won?
  end

  def won?
    win[3] = [0,1,2]
    win[6] = [2,6,8]

    !draw? &&


  end

  def draw?
    !won(board) || !winner
  end

  def winner

  end

  def turn
    counter = 0
    board.each do |token|
      if token == player_1 || token == player_2
        counter += 1
      end
    end
    turn
  end

  def play

  end




end
