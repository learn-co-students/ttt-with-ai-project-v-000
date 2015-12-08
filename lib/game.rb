class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def initialize(player_1 = Player::Human.new('X'), player_2 = Player::Human.new('O'), board = Board.new)
    self.player_1 = player_1
    self.player_1.parity = :even
    self.player_2 = player_2
    self.player_2.parity = :odd
    self.board = board
    self.board.token_1 = self.player_1.token
    self.board.token_2 = self.player_2.token
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]

      if ((position_1 == self.player_1.token && position_2 == position_1 && position_3 == position_1) || (position_1 == self.player_2.token && position_2 == position_1 && position_3 == position_1))
        return win_combination
      end
    end
    false
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
  end

  def turn
    if board.turn_count == 0
      puts self.player_1.token + ' goes first.'
      puts 'Here is the board:'
      self.board.display
    end
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      puts 'Here is the new board:'
      self.board.display
    else
      puts 'That input was not valid. The turn will repeat.'
      self.turn
    end
  end

  def play
    until self.over? do
      self.turn
    end
    if self.won?
      token = self.winner
      if token == 'X'
        puts 'Congratulations X!'
      elsif token == 'O'
        puts 'Congratulations O!'
      else
        puts 'Congratulations ' + self.winner + '!'
      end
    else
      puts 'Cats Game!'
    end
  end
end