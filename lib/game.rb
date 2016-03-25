class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [6, 4, 2],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def initialize(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    true if won? || draw?
  end

  def won?
    x_cells = self.board.cells.each_index.select{|i| self.board.cells[i] == "X"}
    o_cells = self.board.cells.each_index.select{|i| self.board.cells[i] == "O"}
    WIN_COMBINATIONS.each do |combination|
      return combination if combination.all? {|pos| x_cells.include?(pos)}
      return combination if combination.all? {|pos| o_cells.include?(pos)}
    end
    false
  end

  def draw?
    true if self.board.full? && !won?
  end

  def winner
    self.board.cells[won?[0]] if won?
  end

  def turn
    move = current_player.move(self.board)
    if self.board.valid_move?(move)
      self.board.update(move, current_player)
    else
      turn
    end
  end

  def play
    while !over?
      turn
      self.board.display
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end




end
