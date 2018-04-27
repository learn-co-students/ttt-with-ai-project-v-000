class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [2, 5, 8], [1, 4, 7],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    # @board.cells.collect{|space| space == "X"}.size.odd? || @board.cells == @board.reset! ? @player_1 : @player_2
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    @board.full? || self.draw? || self.won?
  end

  # def won?
  #   # Why is X the winner?
  #   WIN_COMBINATIONS.any? do |combo|
  #     if @board.taken?(combo[0]) && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
  #       return combo
  #     end
  #   end
  # end
  def won?

     WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board.cells[win_index_1] # load the value of the board at win_index_1
    position_2 = @board.cells[win_index_2] # load the value of the board at win_index_2
    position_3 = @board.cells[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
      end
   end
   false
  end

  def draw?
    @board.full? && !self.won?
  end

  def winner
    if self.won?
      @board.cells[self.won?[0]]
    else
      nil
    end
  end

  def turn

    puts "Please enter a number (1-9):"

    user_input = self.current_player.move(@board)

    if @board.valid_move?(user_input)
      @board.cells[user_input.to_i - 1] = self.current_player.token
      # p @board.cells
      # p self.current_player
    else
      user_input = self.current_player.move(@board)
    end
    @board.display

    # @board.update(self.current_player.move(@board), self.current_player)
    # self.current_player.move(@board)  unless @board.valid_move?(user_input)
  end

 def play
   @board.display

    until self.over?
    self.turn
  end

  if self.won?
    puts "Congratulations #{self.winner}!"
  elsif self.draw?
    puts "Cat's Game!"
   end
 end

 def start
# Greet the user with a message.
puts "Welcome to Tic Tac Toe!"
puts " "
# Prompt the user for what kind of game they want to play, 0,1, or 2 player.
puts "Who will be player one?"
puts "Human or Computer?"
puts "Remember, player one is X."
first = gets.strip
puts " "
# Ask the user for who should go first and be "X".
puts "Who will be player two?"
puts "Human or Computer?"
puts "Remember, player two is O."
second = gets.strip
# Use the input to correctly initialize a Game with the appropriate player types and token values.
if first == "Computer"
  @player_1 = Players::Computer.new("X")
end

puts " "

if second == "Computer"
  @player_2 = Players::Computer.new("O")
end

self.play
puts "Would like to play again?"
puts "Y / N ?"
again = gets.strip

if again == "Y"
  @board.reset!
  self.start
end
# When the game is over, the CLI should prompt the user if they would like to play again and allow
#  them to choose a new configuration for the game as described above. If the user doesn't want to
#  play again, exit the program.
end




end
