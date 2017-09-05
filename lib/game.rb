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
    self.board.display
    1.times { |i| puts ""}
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
    #puts "Please enter a number between(1-9):"
    #get input
    user_input = self.current_player.move(@board)
    # check if user_input is valid
    self.board.valid_move?(user_input) ? self.board.update(user_input, self.current_player) : turn
  end

  # Helper Method
  def play
    turn until over?
    #t = Time.now
    #sleep(t + 1 - Time.now)
    puts winner ?  "Congratulations #{winner}!" : "Cat's Game!"
  end

  ###### Computer vs Computer game code below ######
    # Helper Method
    def computer_turn
      user_input = self.current_player.move(@board)
      # check if user_input is valid
      user_input ? self.board.update(user_input, self.current_player) : self.computer_turn

    end
    # Helper Method
    def computer_play
      self.computer_turn until over?
      1.times { |i| puts ""}
      puts winner ?  "Congratulations #{winner} !" : "Cat's Game!"
      1.times { |i| puts ""}
    end

###### Computer vs Logic game code below ######
    def logic_turn
      #binding.pry
      user_input = self.current_player.move(@board)
      self.board.update(user_input, self.current_player)
      #user_input = self.current_player.move(@board)
      # check if user_input is valid
      #user_input ? self.board.update(user_input, self.current_player) : self.logic_turn
    end
    # Helper Method
    def logical_play
      self.logic_turn until over?
      1.times { |i| puts ""}
      puts winner ?  "Congratulations #{winner} !" : "Cat's Game!"
      1.times { |i| puts ""}
    end
end
