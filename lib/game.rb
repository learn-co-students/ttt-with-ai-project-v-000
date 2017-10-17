class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    number = nil
    first = nil

    until number == "0" || number == "1" || number == "2"
      puts "Enter the number of players (0, 1, or 2):"
      number = gets.strip
    end

    if number == "0"
      self.player_1 = Players::Computer.new("X")
      self.player_2 = Players::Computer.new("O")
      self.play
    elsif number == "1"
      until first == "Y" || first == "N"
        puts "Would you like to go first? (Y/N)"
        first = gets.strip.upcase
      end
      if first == "Y"
        self.player_2 = Players::Computer.new("O")
        puts "You're X!"
      else
        self.player_1 = Players::Computer.new("X")
        puts "You're O!"
      end
      self.board.display
      self.play
    else
      self.board.display
      self.play
    end
  end

  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    end
    if self.draw?
      puts "Cat's Game!"
    end
  end

  def turn
    move = self.current_player.move(self.board)
    if self.board.valid_move?(move)
      self.board.update(move, self.current_player)
      self.board.display
    else
      self.turn
    end
  end

  def current_player
    self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
  end

  def won?
    won = false
    WIN_COMBINATIONS.each do |win|
      if !won && win.all? {|cell| self.board.cells[cell] == "X"} || win.all? {|cell| self.board.cells[cell] == "O"}
        won = win
      end
    end
    won
  end

  def winner
    if self.won?
      self.board.cells[self.won?[0]]
    end
  end

  def over?
    self.draw? || self.won?
  end

  def draw?
    self.board.full? && !self.won?
  end

end
