class Game

	attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS =[
     [0,1,2],#0 #top row horizontal
     [3,4,5],#1 #middle row horizontal
     [6,7,8],#2 #buttom row horizontal

     [0,3,6],#3 #left column verical
     [1,4,7],#4 #middle column verical
     [2,5,8],#5 #right column verical

     [8,4,0],#6 #left_to_right adj
     [2,4,6] #7 #right_to_left adj
   ]
	 			#creates 2 human player X && O while setting up a new board from board class
    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

		#keeps track of the current player w/ the following ternary operator
    def current_player
     @board.turn_count.even? ? @player_1 : @player_2
    end

		#returns true || false if the game is over
    def over?
       won? || draw?
    end
		# returns nil if the game is not won or the set where they wom
    def won?
      WIN_COMBINATIONS.find do |index|
        @board.cells[index[0]] == @board.cells[index[1]] &&
        @board.cells[index[1]] == @board.cells[index[2]] && @board.taken?(index[2]+1)
      end
    end
		# returns boolean if its a draw
    def draw?
      won?.nil? && board.full?
    end

		# returns X || O depending on the winner
    def winner
       won? ? @board.cells[won?[0]] : nil
    end

		# validates a choosen move if not valid it will ask again
		def turn
			input = current_player.move(board)
				if @board.valid_move?(input)
					@board.update(input, current_player)
					@board.display
				else
					puts "That cell has been already played"
					turn
			end
		end

		# loops until the game is over which means there will be a winner or draw
		def play
			turn until over?
			if winner !=nil
					puts "Congratulations #{winner}!"
				else
					puts "Cat's Game!"
			end
			
		end
end
