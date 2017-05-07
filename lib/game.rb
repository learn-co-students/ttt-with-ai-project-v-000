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

    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      @board = board
      @player_1 = player_1
      @player_2 = player_2
    end

    def current_player
     @board.turn_count.even? ? @player_1 : @player_2
    end

    def over?
       won? || draw?
    end

    def won?
      WIN_COMBINATIONS.find do |index|
        @board.cells[index[0]] == @board.cells[index[1]] &&
        @board.cells[index[1]] == @board.cells[index[2]] && @board.taken?(index[2]+1)
      end
    end

    def draw?
      won?.nil? && board.full?
    end

    def winner
       won? ? @board.cells[won?[0]] : nil
    end

		def turn
			input = current_player.move(nil)
				if @board.valid_move?(input)
					@board.update(input, current_player)
				else
					puts "That cell has been already played"
					turn
			end
		end

		def play
			turn until over?
			if winner !=nil
					puts "Congratulations #{winner}!"
				else
					puts "Cat's Game!"
			end
		end
end
