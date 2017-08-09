class Game

	attr_accessor :board, :player_1, :player_2

	WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  	]

	def initialize(player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board = Board.new)
    	@board = board
    	@player_1 = player_1
    	@player_2 = player_2
  	end

  	def current_player
      	board.turn_count.even? ? player_1 : player_2
    end

    def draw?
    	board.full? && !won?
    end

    def over?
    	draw? || won? ? true : false
    end

    def won?
    	WIN_COMBINATIONS.detect do |combos|
        win_index_1 = combos[0]
        win_index_2 = combos[1]
        win_index_3 = combos[2]

        position_1 = self.board.cells[win_index_1]
        position_2 = self.board.cells[win_index_2]
        position_3 = self.board.cells[win_index_3]

        position_1 == "X" && position_2 == "X" && position_3 == "X" ||
        position_1 == "O" && position_2 == "O" && position_3 == "O"
        end
    end

    def winner
		  winner = board.cells[won?[0]] if won?
     winner 
    end

    def turn
        board.display
      	current_move = current_player.move(self.board)
      if self.board.valid_move?(current_move) == true
        self.board.update(current_move, current_player)
      else 
        turn
      end   
    end

    def play
    	while !over?
      	turn
    	end
    	puts "Cat's Game!" if draw? else puts "Congratulations #{winner}!"
  	end
end



  
    	