class Game
    attr_accessor :player_1, :player_2, :board

    WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
  end

  def current_player
      self.board.turn_count.even? ? player_1 : player_2
  end

  def won?
      WIN_COMBINATIONS.detect do |combination|
      combination.all? {|number| self.board.cells[number] == "X"} ||
      combination.all? {|number| self.board.cells[number] == "O"}
    end
  end

  def draw?
      self.board.full? && !self.won?
  end

  def over?
      self.won? || self.draw?
  end

  def winner
      self.board.cells[self.won?[0]] if self.won?
  end

  def turn
      move = "invalid"
      while move == "invalid"
          input = self.current_player.move(self.board).to_i
          if self.board.valid_move?(input)
              move = input
          end
      end
      self.board.update(move, self.current_player)
      self.board.display
  end

  def play
      self.board.display
      while !self.over?
          self.turn
      end
      if self.draw?
          puts "Cat's Game!"
      else
          puts "Congratulations #{self.winner}!"
      end
  end

end
