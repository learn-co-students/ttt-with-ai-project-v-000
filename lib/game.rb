class Game
  attr_accessor :board, :player_1, :player_2, :token

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]
  ]

  def turn_count
    turn_count = 0

    @board.cells.each do |value|
      turn_count += 1 if value.include?('X') || value.include?('O')
    end

    turn_count
  end

  def current_player
    @player_1 if turn_count.even? || @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]

      return win_combination if @board.taken?(win_index_1) && position_1 == position_2 && position_2 == position_3
    end
    false
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    nil || @board.cells[won?.first] if won? != false
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, player)
    else
      turn
    end
  end

  def play
  end
end
