class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],
                      [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"),
    player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def won?
    won = false
    cells = self.board.cells
    WIN_COMBINATIONS.each do |arr|
      if cells[arr[0]] == cells[arr[1]] && cells[arr[1]] == cells[arr[2]]
        won = arr unless cells[arr[0]] == " "
      end
    end
    won
  end

  def draw?
    if self.board.full? && !self.won?
      true
    else
      false
    end
  end

  def winner
    if won?
      self.board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
    else
      self.turn
    end
  end

  def play
    until self.over?
      self.board.display
      self.turn
    end
    self.board.display
    puts "Congratulations #{self.winner}!" if self.won?
    puts "Cat's Game!" if self.draw?
  end

end
