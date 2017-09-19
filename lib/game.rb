class Game
  WIN_COMBINATIONS = [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full? || won? || draw?
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if board.cells[combo[0]] == "X" && board.cells[combo[1]] == "X" && board.cells[combo[2]] == "X"
        return combo
      elsif board.cells[combo[0]] == "O" && board.cells[combo[1]] == "O" && board.cells[combo[2]] == "O"
        return combo
      end
    end
    false
  end

  def draw?
    board.full? && !won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      puts "Computer entered #{input}" if current_player.class == Players::Computer
      board.update(input, current_player)
      board.display
    else
      turn
    end
  end

  def play
    board.display
    turn until over?
    puts "Congratulations #{winner}!" if winner
    puts "Cat's Game!" if draw?
  end

end