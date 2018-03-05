class Game
    attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    won? || draw?
  end


  def won?
    WIN_COMBINATIONS.find do |win_combo|
    @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
    @board.cells[win_combo[1]] == @board.cells[win_combo[2]] &&
    @board.taken?(win_combo[0]+1)
  end
end


  def draw?
    @board.full? && !won?
  end

  def winner
    if winner_combo = won?
      @winner = @board.cells[winner_combo.first]
    end
  end

  def turn
    puts "Please enter a number: 1-9"
      move = current_player.move(board)
      if @board.valid_move?(move)
        @board.update(move, current_player)
      else
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
