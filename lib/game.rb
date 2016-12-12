class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  attr_accessor :player_1, :player_2, :board
  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw? ? true : false
  end

  def won?
    xes = []
    oes = []
    board.cells.each_with_index do|pos, index|
      if pos == "X"
        xes << index
      elsif pos == "O"
        oes << index
      end
    end
  if WIN_COMBINATIONS.any? {|combo| combo.all? {|pos| xes.include?(pos)}}
    return true
  elsif WIN_COMBINATIONS.any? {|combo| combo.all? {|pos| oes.include?(pos)}}
    return true
  else
    return false
  end
  end

  def draw?
    won? == false && board.full? ? true : false
  end

  def winner
    xes = []
    oes = []
    board.cells.each_with_index do|pos, index|
      if pos == "X"
        xes << index
      elsif pos == "O"
        oes << index
      end
    end
  if WIN_COMBINATIONS.any? {|combo| combo.all? {|pos| xes.include?(pos)}}
    "X"
  elsif WIN_COMBINATIONS.any? {|combo| combo.all? {|pos| oes.include?(pos)}}
    "O"
  end
  end

  def turn
    input = current_player.move(board)
    while board.valid_move?(input) == false
      board.display
      puts "Invalid move. Please enter a different position."
      input = current_player.move(board)
    end
    board.update(input, current_player)
    board.display
  end

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

end