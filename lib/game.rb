class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]].freeze

  def initialize(player1 = Players::Human.new('X'), player2 = Players::Human.new('O'), board = Board.new)
    @board = board
    @player_1 = player1
    @player_2 = player2
  end

  def current_player
    (board.turn_count + 1).even? ? @player_2 : @player_1
  end

  def won?
    board = @board.cells
    WIN_COMBINATIONS.each do |combo|
      if @board.taken?(combo[0] + 1) && (board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]])
        return combo
      end
    end
    false
  end

  def full?
    !(@board.cells.include? ' ')
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    puts 'Enter a move (1-9): '
    move = current_player.move(nil)
    unless @board.valid_move?(move)
      turn
      return nil
    end
    @board.update(move, current_player)
    @board.display
  end

  def play
    @board.display
    turn until over?
    puts draw? ? "Cat's Game!" : "Congratulations #{winner}!"
  end
end
