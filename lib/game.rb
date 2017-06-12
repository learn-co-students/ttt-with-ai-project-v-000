class Game

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Left down diagonal
    [2, 4, 6], # Left up diagonal
  ]

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      puts "Invalid move, please try again."
      board.display
      turn
    end
  end

  def over?
    self.won? || self.draw?
  end

  def won?
     WIN_COMBINATIONS.detect do |combination|
       board.cells[combination[0]] == board.cells[combination[1]] &&
       board.cells[combination[1]] == board.cells[combination[2]] &&
       board.taken?(combination[0]+1)
     end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
