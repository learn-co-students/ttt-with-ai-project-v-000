class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0]+1)
    end
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if winning_combo = won?
      @winner = board.cells[winning_combo.first]
    end
  end

  def turn
    puts "Make your move! 1-9:"
    puts "Turn: #{@board.turn_count+1}\n"
    input = current_player.move(board)
    if !board.valid_move?(input)
      turn
    else
      board.update(input, current_player)
      board.display
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end