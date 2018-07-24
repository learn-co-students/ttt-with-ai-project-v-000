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
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?

    WIN_COMBINATIONS.find do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0] + 1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    self.draw? || self.won? ? true : false
  end

  def winner
    if winning_combo = won?
     @board.cells[winning_combo.first]
   end
  end

  def turn
    puts "Please choose a spot on the board(#1-9)"
    @board.display
    player = self.current_player
    move = player.move(board)
    if !board.valid_move?(move)
      self.turn
    else
      @board.display
      board.update(move, player)
    end
  end


  def play
    puts "Lets start!"
   turn until over?
    if self.won?
        puts "Congratulations #{winner}!"
      elsif self.draw?
        puts "Cat's Game!"
      end
    end

end
