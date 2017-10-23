class Game
    attr_accessor :board, :player_1, :player_2

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]


def current_player
  @board.turn_count.even? ? player_1 : player_2
end

def won?
  WIN_COMBINATIONS.detect do |combo|
      if combo.all? {|i| @board.cells[i] == "X"} || combo.all? {|i| @board.cells[i] == "O"}
        return combo
    end
  end
    # return combo
    # false for draw?
    # returns correct win combination
    # isn't hard coded
end


  def draw?
    self.board.full? && !self.won?
    # true for game.board.cells = [full array with no winner]
    # false for in-progress
    # false for won?
  end

  def over?
    @board.full? || draw? || won?
  end

  def winner
    self.won? ? @board.cells[won?[0]] : nil
#this works with or without "self". do i need it?
  end

  def turn
    @board.display
    puts "Please enter 1-9 to make a move:"
    input = self.current_player.move(board)
    while !@board.valid_move?(input)
      puts "Please enter a valid number:"
      input = self.current_player.move(board)
    end
      @board.update(input, current_player)
      @board.display
    if !won?
      puts "Please enter 1-9 to make a move:"
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
