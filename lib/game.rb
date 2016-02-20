class Game

attr_accessor :board, :player_1, :player_2, :cells

WIN_COMBINATIONS = [
   [0,1,2], # top row
   [3,4,5], # middle row
   [6,7,8], # bottom row
   [0,3,6], # left column
   [1,4,7], # middle column
   [2,5,8], # right column
   [0,4,8], # left diag
   [2,4,6] # right diag
]
	#defines all the win combos to win the game.

  def initialize(player_1 = Human.new('X'), player_2 = Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

	def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
	end

	def over?
		(@board.full? || won? || draw?) ? true : false
	end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board.get_cells(combination).uniq.length == 1
        token = @board.cells[combination[0]]
        if (token == "X") || (token == "O")
          @winner = token
          return true
        end
      end
    end
    false
  end

  def draw?
    return true if @board.full? && (self.won? == false)
    false
  end

  def winner
    self.won?
    @winner == " " ? nil : @winner
  end

	def self.turn
		#makes valid moves, asks for input for non-valid moves and changes to player 2 after first move
	end

	def self.play
		#asks for a players input on a turn
		#checks if the game is over after each turn
		#checks if a game is won after each turn
		#checks if a game is a draw after each turn
		#stops playing when someone has won the game
		#prints "Cat's Game" in the event of a draw
		#congradulates the winner, either X or O
		#And, uh, plays through a whole game of course

	end
end
