class Game

require 'pry'
	# attr_reader :board
	attr_accessor :board, :player_1, :player_2

	def initialize(player_1 = Player.new("X"), player_2 = Player.new("O"), board = Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end

	WIN_COMBINATIONS = [
						[0,3,6],
						[0,1,2],
						[3,4,5],
						[6,7,8],
						[0,6,2],
						[1,4,7],
						[2,5,8],
						[0,4,8],
						[6,4,2]
						]

	def board=(board)
		@board = board
	end 


	@cells = Array.new(9," ")

end 

    # it 'returns true for a win' do
    #   game = Game.new
    #   game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

    #   expect(game.won?).to be_truthy
    # end
   
    def won?
    	# will return true if game won
    	@cells
    	binding.pry

    end 

