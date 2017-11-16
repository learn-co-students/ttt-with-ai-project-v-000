class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [2,4,6]]

  def initialize(player_1_obj = nil, player_2_obj = nil, board_obj = nil)
    if [player_1_obj, player_2_obj, board_obj].all? { |elem| elem == nil }
      self.player_1 = Players::Human.new('X')
      self.player_2 = Players::Human.new('O')
      self.board = Board.new
    else
      self.player_1 = player_1_obj
      self.player_2 = player_2_obj
      self.board = board_obj
    end
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    self.won? || self.board.full?
  end

  def won?
    WIN_COMBINATIONS.find do |combination|
      combination.all? { |index| self.board.cells[index] == "X"} ||
      combination.all? { |index| self.board.cells[index] == "O"}
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    self.board.cells[self.won?.first] if self.won?
  end

  def turn
    input = self.current_player.move(self.board)
    until self.board.valid_move?(input)
      input = self.current_player.move(self.board)
    end

    self.board.update(input, self.current_player)
  end

end
