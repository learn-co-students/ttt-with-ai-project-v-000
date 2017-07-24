class Game
  attr_accessor :board, :player_1, :player_2, :game_choice, :input_output

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ]

  def current_player
    self.board.turn_count.odd? ? self.player_2 : self.player_1
  end

  def draw?
    !self.won? && self.board.full?
  end
  
  def initialize(player_1 = Players::Human.new(Board::TOKEN_CROSS),
                 player_2 = Players::Human.new(Board::TOKEN_NOUGHT),
                 board = Board.new,
                 io = InputOutput::CLI.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
    self.input_output = io
  end

  def lost?
    !self.won? && !self.draw?
  end

  def over?
    self.won? || self.draw?
  end

  def play
    until self.over?
      turn
    end
    if self.won?
      self.input_output.display "Congratulations #{winner}!"
    elsif self.draw?
      self.input_output.display "Cat's Game!"
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)

    if self.board.valid_move?(current_move)
      self.input_output.display "Turn #{self.board.turn_count + 1}"
      self.board.update(current_move, player)
      self.input_output.display "Move of player #{player.token} was #{current_move}"
      self.board.display
      self.input_output.display "\n\n"
    else
      turn
    end
  end

  def won?
    !!win_combination
  end

  def winner
    self.board.cells[win_combination.first] if self.over?
  end

  private

  def win_combination
    WIN_COMBINATIONS.detect do |win_combination|
      token_at_position1 = self.board.cells[win_combination[0]]
      token_at_position2 = self.board.cells[win_combination[1]]
      token_at_position3 = self.board.cells[win_combination[2]]

      Board::ALL_TOKENS.include?(token_at_position1)\
        && (token_at_position1 == token_at_position2)\
        && (token_at_position2 == token_at_position3)
    end
  end
end
