class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

    def over?
      if (@board.full? || self.won? || self.draw?)
      true
      else
        false
      end

    end

  def won?
    WIN_COMBINATIONS.each do |cells|
        if (@board.cells[cells[0]] == "X" && @board.cells[cells[1]] == "X" && @board.cells[cells[2]] == "X") || (@board.cells[cells[0]] == "O" && @board.cells[cells[1]] == "O" && @board.cells[cells[2]] == "O")
          @won = @board.cells[cells[0]]
          return true
        end #if board
    end #detect end
    false
  end #won? end

  def draw?
    @board.full? && !self.won? ? true : false
  end

  def winner
    self.won? ? @won : nil
  end

  def turn
    puts "Where would you like to go (1 - 9): "
    index = self.current_player.move(@board)
    if @board.valid_move?(index)
      @board.update(index,self.current_player)
      @board.display
    else
      self.turn
    end
  end

  def play
    @board.display
    until self.over? do
      self.turn

    end

    if self.won?
     puts "Congratulations #{self.winner}!"
   elsif self.draw?
     puts "Cat's Game!"
     end
  end
end
