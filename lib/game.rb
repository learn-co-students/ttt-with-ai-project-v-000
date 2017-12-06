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
    [2,4,6]
  ]
#  ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    if player_1 == nil && player_2 == nil && board == nil
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      @board = Board.new
    else
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    position = board.cells
      #Check if the board contains the same token in each of the three indexes of any winning combination
    WIN_COMBINATIONS.detect do |combo|

      (position[combo[0]] == "X" && position[combo[1]] == "X" && position[combo[2]] == "X") || (position[combo[0]] == "O" && position[combo[1]] == "O" && position[combo[2]] == "O")
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    board.display
    if current_player.class == Players::Human
      puts "Where would you like to move?"
    end
    position = self.current_player.move(@board)
    #binding.pry
    if board.valid_move?(position)
      board.update(position, self.current_player)
    else
      puts "Invalid move, please select an empty space" if current_player.class == Players::Human
      turn
    end
  end

  def play
    while !over?
      turn
    end
    board.display
    won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
  end

end
