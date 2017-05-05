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
  ].freeze

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full?
  end

  # TODO: refactor with #winner
  def won?
    i = 0
    is_won = false
    while i < WIN_COMBINATIONS.size && is_won != true
      hold = WIN_COMBINATIONS[i].collect { |p| board.cells[p] }
      is_won = hold.uniq.size == 1 && !hold.include?(" ")
      i += 1
    end
    is_won
  end

  def draw?
    over? && !won?
  end

  # TODO: refactor with #won?
  def winner
    hold = nil
    winner_found = false
    if won?
      i = 0
      while i < WIN_COMBINATIONS.size && !winner_found
        hold = WIN_COMBINATIONS[i].collect { |p| board.cells[p] }
        if hold.all? && !hold.include?(" ")
          hold = hold[0]
          winner_found = true
        end
        i += 1
      end
    end
    hold
  end

  def turn
    user_input = current_player.move(board)
    turn unless board.valid_move?(user_input)
    board.update(user_input, current_player)
    board.display
  end

  def play
    board.display
    turn until over? || won? || draw?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end

  def replay?
    puts "Would you like to play again? (y/n)"
    true if gets.chomp == "y"
  end

  def start
    play
    start if replay?
  end
end
