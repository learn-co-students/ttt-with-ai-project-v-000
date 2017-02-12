class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]]
  attr_accessor :board, :player_1, :player_2, :index, :user_input

  def initialize(player_1 = Players::Human.new(token = "X"), player_2 = Players::Human.new(token = "O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def turn
    player = current_player
    move(user_input)
    if board.valid_move?
      board.update(user_input, player)
      board.display
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      !(board.cells[combination[0]].include? " ") && board.cells[combination[0]] == board.cells[combination[1]] && board.cells[combination[1]] == board.cells[combination[2]]
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won? || board.full?
  end

  def winner
    if won?
      #binding.pry
      board.cells[won?[0]]
    else
      nil
    end
  end

end
