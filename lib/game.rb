require 'pry'
class Game
  WIN_COMBINATIONS  = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each_with_index do |x|
        if board.cells[x[0]] == "X" && board.cells[x[1]] == "X" && board.cells[x[2]] == "X"
          winner = x
        elsif board.cells[x[0]] == "O" && board.cells[x[1]] == "O" && board.cells[x[2]] == "O"
          winner = x
        end
    end
    winner = false if winner == nil
    winner
  end

  def draw?
    # return true if no one won the game
    !won?
  end

  def over?
    # return true if it's a draw or the board is full or someone won the game
    draw? && board.full? || won?
  end

  def winner
    # return winning token by using the winning cells index if a player won
    board.cells[won?[0]] unless !won?
  end

  def turn
    player = current_player
    current_move = player.move(board)

    if !board.valid_move?(current_move)
      turn
    else
      board.update(current_move, player)
      player = current_player
    end
  end

  def play
    while !over?
      turn
    end
  end

end
