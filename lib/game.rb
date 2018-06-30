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

 def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all?{|cell| board.cells[cell] == "X"} ||
      combo.all?{|cell| board.cells[cell] == "O"}
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    champ = ""
    if champ = won?
      board.cells[champ[0]]
    end
  end

  def turn
    selection = ""
    selection = current_player.move(board)
    if board.valid_move?(selection)
      board.update(selection, current_player)
    else
      puts "Invalid input."
      puts "Player #{current_player.token}, please enter 1-9:"
      turn
    end
  end

  def play
    board.display
    while !over?
      puts "Player #{current_player.token}, please enter 1-9:"
      turn
      board.display
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
