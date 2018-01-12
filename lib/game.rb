class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def turn_count
    counter = 0
    self.board.cells.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    self.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = self.board.cells[win_combination[0]]
      position_2 = self.board.cells[win_combination[1]]
      position_3 = self.board.cells[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def draw?
    self.board.full? && !won?
  end

  def over?
    self.draw? || self.won?
  end

  def winner
    won = won?
    if won
      self.board.cells[won[0]]
    end
  end

  def turn
    self.board.update(self.current_player.move(self.board), self.current_player)
    self.board.display
    puts "\n"
    self.current_player == self.player_1 ? "1" : "2"
  end

  def play
    until self.over?
      puts "PLAYER [#{self.current_player.token}]'S TURN\n"
      self.turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def start
    puts "\n"
    puts "PLAYER 1 [#{self.player_1.token}] / VS / PLAYER 2 [#{self.player_2.token}]"
    puts "\n"
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts "\n"
    self.play
  end
end
