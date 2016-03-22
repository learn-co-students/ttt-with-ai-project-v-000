class Game

  attr_accessor :board, :player_1, :player_2, :winner

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

  def initialize (player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @winner = winner
  end

  def current_player
    turn = self.board.turn_count + 1
    if turn % 2 == 0
      player_2
    else
      player_1
    end
  end

  def over?
    draw? || won?
  end

  def has_combo(player)
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |position| self.board.cells[position] == player.token }
    end
  end

  def won?
    has_combo(player_1) || has_combo(player_2)
  end

  def draw?
    self.board.full? && !won?
  end

  def winner
    if combo = won?
      @winner = board.position(combo[0]+1)
    end
  end

  def turn
    board.display
    puts "Please enter 1-9:"
    move = current_player.move(board)
    if !board.valid_move?(move)
      turn
    end
    board.update(move,current_player)
    board.display
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cats Game!"
    end
  end

end