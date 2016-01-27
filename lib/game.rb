class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], # across
    [0,3,6], [1,4,7], [2,5,8], # down
    [0,4,8], [2,4,6]           # diagonal
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    return @player_1 if @board.turn_count % 2 == 0
    @player_2
  end

  def over?
    @board.full? || winner != nil
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      tokens = [@board.cells[combo[0]], @board.cells[combo[1]], @board.cells[combo[2]]]
      return "X" if tokens.count("X") == 3
      return "O" if tokens.count("O") == 3
    end
    nil
  end

  def won?
    return true if winner != nil
    false
  end

  def draw?
    return true if @board.full? && winner == nil
    false
  end

  def turn
    input = ""
    until @board.valid_move?(input) do
      input = current_player.move(@board)
    end
    @board.update(input, current_player)
  end

  def play
    9.times do
      turn
      break if over?
    end
    # binding.pry
    if draw?
      print "Cats Game!"
    elsif won?
      puts "Congratulations #{winner.token}!"
    end
  end
end

#game = Game.new
#game.play
