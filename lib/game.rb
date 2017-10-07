class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],[1, 4, 7],[2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
  board.turn_count.even? ? player_1 : player_2
  end

  def over?
    #binding.pry
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      (board.cells[combination[0]] == board.cells[combination[1]]) && (board.cells[combination[0]] == board.cells[combination[2]]) unless board.cells[combination[0]] == " "
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    won? ? board.cells[won?[0]] : nil
  end

  def current_player
    board.turn_count.even? ? player = player_1 : player_2
  end

  def turn
    index = current_player.move(board)
    if board.valid_move?(index)
      board.update(index, current_player)
    else
      "invalid"
      turn
    end
  end

  def play
   while !over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end

end
