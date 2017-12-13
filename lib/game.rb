require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end
  #//////////////// MAKE METHOD DETERMINE CURRENT PLAYER BY COUNTING THE TOKEN ON BOARD////////
  def current_player
    g.board.cells.count("O")
    # board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      if board.taken?(combo[0]+1) && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
        combo
      end
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
    else
      turn
    end
  end

  def play
    turn until over? || draw?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

end
