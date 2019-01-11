class Game

  include Players

  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.odd? ? @player_2 : @player_1
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0]+1)

    end
  end

  def draw?
    !@board.cells.include?(" ") && !won? ? true : false
  end

  def over?
    draw? || won?
  end

  def winner
    @board.cells[won?[0]] unless won? == nil
  end

  def turn
    @board.display
    move = current_player.move(board)
    if @board.valid_move?(move)
       true
       @board.update(move, current_player)
    else
       puts "invalid move"
       current_player.move(board)
    end

  end

  def play
    turn until over?

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end


  end



end
