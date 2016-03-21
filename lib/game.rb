class Game

  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = nil, player_2 = nil, board)
    player_1 ? @player_1 = player_1 : @player_1 = Human.new("X")
    player_2 ? @player_2 = player_2 : @player_2 = Human.new("O")
    @board = board
  end

  def turn
    if over?
      return puts winner ? "Congratulations #{winner}!" : "Cats game!"
    end

    @board = current_player.move(@board)
    @board.display
    turn
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def over?
    draw? || won?
  end

  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      arr = combo.map {|c| @board.cells[c]}.sort
      !arr.include?(" ") && arr.first == arr.last
    end
  end

  def winner
   won? ? @board.cells[won?[0]] : nil
  end
end
