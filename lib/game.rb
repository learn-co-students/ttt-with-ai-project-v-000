class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    # Horizontal rows
    [0, 1, 2], # Top
    [3, 4, 5], # Middle
    [6, 7, 8], # Bottom

    # Vertical rows
    [0, 3, 6], # Left
    [1, 4, 7], # Middle
    [2, 5, 8], # Right

    # Diagonal
    [0, 4, 8], # Left to right
    [2, 4, 6] # Right to left
  ]

  def initialize(player_1 = Player.new("X"), player_2 = Player.new("O"), board = Board.new)
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

  def won?
    count = 0
    is_won = false
    while count < WIN_COMBINATIONS.size && is_won != true
      hold = WIN_COMBINATIONS[count].collect { |p| board.cells[p] }
      is_won = hold.uniq!.count == 1 && !hold.include?(" ")
      count += 1
    end

    is_won
  end

  def draw?

  end

  def winner

  end
end
