class Game 

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize (player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    self.won? || self.draw? || self.board.full? ? true : false
  end

  def draw?
    !self.won? && self.board.full? ? true : false
  end

  def full?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = self.board.cells[win_index_1]
      position_2 = self.board.cells[win_index_2]
      position_3 = self.board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    return false
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
  end

  def turn
    if self.board.turn_count == 0
      puts "#{self.player_1} goes first."
      self.board.display
    end
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      self.board.display
      sleep(1)
    else
      puts "That is not a valid move."
      self.turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end

