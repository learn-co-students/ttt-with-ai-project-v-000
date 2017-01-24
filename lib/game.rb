class Game
  include Concerns::Winable
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def draw?
    board.full? && !won?
  end

  def winner
    board.cells[won?.first] if won?
  end

  def turn
    cell = current_player.move(board)

    until board.valid_move?(cell)
      puts "Wrong move buddy!"
      turn
      return
    end

    board.update(cell, current_player)
    board.display
  end

  def play
    board.display

    until over?
      turn
    end

    puts won? ? "Congratulations #{winner}!" :  "Cats Game!"
  end

end
