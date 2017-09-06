class Game

attr_accessor :board, :player_1, :player_2, :token



	def initialize(player_1= Players::Human.new("X"), player_2= Players::Human.new("O"), board=Board.new)
		@player_1 = player_1
		@player_2 = player_2 
		@board = board
	end

	def current_player
		if board.turn_count.even?
			player_1
		else
			player_2
		end
	end

	def over?
		if draw?
			return true
		end
		if won?
			return true
		end
		return false
	end

	def won?
		winning_array = Game::WIN_COMBINATIONS::WIN_COMBINATIONS
		winning_array.detect do |combo|
			board.cells[combo[0]] == board.cells[combo[1]] &&
			board.cells[combo[1]] == board.cells[combo[2]] &&
			board.taken?(combo[0] + 1)
		end		
	end

	def full?
		board.cells.all? do |spot|
			spot.include?("X") == true || spot.include?("O") == true
		end
	end

	def draw?
		if won?
			return false
		end
		if full?
			return true
		end
	end


  def winner
    if (won? == nil)
      return nil
    else
      board.cells[won?.first]
    end
  end

  def turn
  	 input = current_player.move(current_player.token)
  	 if board.valid_move?(input)
  	 	board.update(input, current_player)
  	 else
  	 	turn
  	 end

  end


   def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end




end #end Game Class

# describe 'play' do
#     it 'asks for players input on a turn of the game' do
#       game = Game.new
#       allow($stdout).to receive(:puts)
#       allow(game).to receive(:over?).and_return(false, true)

#       expect(game.player_1).to receive(:gets).at_least(:once).and_return("1")

#       game.play
#     end

#     it 'checks if the game is over after every turn' do
#       game = Game.new
#       allow($stdout).to receive(:puts)
#       allow(game.player_1).to receive(:gets).and_return("1", "2")
#       allow(game.player_2).to receive(:gets).and_return("4", "5")

#       expect(game).to receive(:over?).at_least(:twice).and_return(false, false, true)

#       game.play
#     end

#     it 'plays the first turn of the game' do
#       game = Game.new
#       allow($stdout).to receive(:puts)
#       allow(game.player_1).to receive(:gets).and_return("1")

#       allow(game).to receive(:over?).and_return(false, true)

#       game.play

#       expect(game.board.cells).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
#     end

#     it 'plays the first few turns of the game' do
#       game = Game.new

#       allow($stdout).to receive(:puts)
#       allow(game.player_1).to receive(:gets).and_return("1", "2")
#       allow(game.player_2).to receive(:gets).and_return("4")

#       allow(game).to receive(:over?).and_return(false, false, false, true)

#       game.play

#       expect(game.board.cells).to eq(["X", "X", " ", "O", " ", " ", " ", " ", " "])
#     end

#     it 'checks if the game is won after every turn' do
#       game = Game.new
#       allow($stdout).to receive(:puts)
#       allow(game.player_1).to receive(:gets).and_return("1", "2", "3")
#       allow(game.player_2).to receive(:gets).and_return("4", "5", "6")
#       allow(game).to receive(:winner).and_return("X")

#       expect(game).to receive(:won?).at_least(:twice).and_return(false, false, true)

#       game.play
#     end

#     it 'checks if the game is a draw after every turn' do
#       game = Game.new
#       allow($stdout).to receive(:puts)
#       allow(game.player_1).to receive(:gets).and_return("1", "2")
#       allow(game.player_2).to receive(:gets).and_return("3", "4")

#       expect(game).to receive(:draw?).at_least(:twice).and_return(false, false, true)

#       game.play
#     end

#     it 'stops playing if someone has won' do
#       game = Game.new
#       game.board.cells = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

#       allow($stdout).to receive(:puts)

#       expect(game).to_not receive(:turn)

#       game.play
#     end

#     it 'congratulates the winner X' do
#       game = Game.new
#       game.board.cells = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
#       allow($stdout).to receive(:puts)

#       expect($stdout).to receive(:puts).with("Congratulations X!")

#       game.play
#     end

#     it 'congratulates the winner O' do
#       game = Game.new
#       game.board.cells = [" ", " ", " ", " ", " ", " ", "O", "O", "O"]

#       allow($stdout).to receive(:puts)

#       expect($stdout).to receive(:puts).with("Congratulations O!")

#       game.play
#     end

#     it 'stops playing in a draw' do
#       game = Game.new
#       game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

#       allow($stdout).to receive(:puts)

#       expect(game).to_not receive(:turn)

#       game.play
#     end

#     it 'prints "Cat\'s Game!" on a draw' do
#       game = Game.new
#       game.board.cells = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

#       allow($stdout).to receive(:puts)

#       expect($stdout).to receive(:puts).with("Cat's Game!")

#       game.play
#     end

#     it 'plays through an entire game' do
#       game = Game.new
#       allow($stdout).to receive(:puts)

#       expect(game.player_1).to receive(:gets).and_return("1")
#       expect(game.player_2).to receive(:gets).and_return("2")
#       expect(game.player_1).to receive(:gets).and_return("3")
#       expect(game.player_2).to receive(:gets).and_return("4")
#       expect(game.player_1).to receive(:gets).and_return("5")
#       expect(game.player_2).to receive(:gets).and_return("6")
#       expect(game.player_1).to receive(:gets).and_return("7")

#       expect($stdout).to receive(:puts).with("Congratulations X!")

#       game.play
#     end
#   end



class Game::WIN_COMBINATIONS

	attr_accessor :board

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

	def self.any?
	  i = 0
	  value = false
	  while i < WIN_COMBINATIONS.size
	    if yield(WIN_COMBINATIONS[i])
	 			value = true
	    end
	    i += 1
	  end
	 	value
	end



end




