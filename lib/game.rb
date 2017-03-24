class Game
  attr_accessor :player_1, :player_2, :board

  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]]

  def initialize(player_1 =  Players::Human.new("X"), player_2 =  Players::Human.new("O"), board =  Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if board.turn_count.even?
      self.player_1
    elsif board.turn_count.odd?
      self.player_2
    end
  end

  def over?
    board.full?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if win_combo.all? {|cell| self.board.cells[cell] == "X"} || win_combo.all? {|cell| self.board.cells[cell] == "O"}
        win_combo
      else
        false
      end
    end
  end

  def draw?
    self.over? && !self.won?
  end

  def winner
    if won?
      self.board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    player = self.current_player
    input = " "
    until self.board.valid_move?(input)
      input = player.move(self.board)
    end
    self.board.update(input, player)
    puts "Nice move!"
    self.board.display
  end

  def play
    until self.won? || self.draw?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end

  def self.start
    puts "How many players? [0, 1, 2]"
    players = gets.chomp

    case players
    when "2"
      game = self.new
    when "1"
      game = self.new(player_1 =  Players::Human.new("X"), player_2 =  Players::Computer.new("O"), board =  Board.new)
    when "0"
      game = self.new(player_1 =  Players::Computer.new("X"), player_2 =  Players::Computer.new("O"), board =  Board.new)
    end
  end

end
