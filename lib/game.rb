class Game
  attr_accessor :board, :player_1, :player_2
  #constant
    WIN_COMBINATIONS = [
  						        [0,1,2],
  						        [3,4,5],
  						        [6,7,8],
  						        [0,3,6],
  						        [1,4,7],
  						        [2,5,8],
  						        [0,4,8],
  						        [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  # Helper Method
  def current_player
    self.board.turn_count.even? ? @player_1 : @player_2
  end

  # Helper Method
  def over?
  	won? || draw?
  end

  # Helper Method
  def draw?
  	self.board.full? && !won?
  end

  # Helper Method
  def won?
  	WIN_COMBINATIONS.find do |win|
  	 self.board.cells[win[0]] == self.board.cells[win[1]] && self.board.cells[win[0]] == self.board.cells[win[2]] && self.board.cells[win[0]] != " "
    end
  end

  # Helper Method
  def winner
  	if won?
      self.board.cells[won?[0]]
    end
  end

  # Helper Method
  def turn
    puts "Please enter a number between(1-9):"
    #get input
    user_input = self.current_player.move(@board)
    # check if user_input is valid
    self.board.valid_move?(user_input) ? self.board.update(user_input, self.current_player) : turn
  end

  # Helper Method
  def play
    turn until over?
    puts winner ?  "Congratulations #{winner}!" : "Cat's Game!"
  end
end
