class Game
<<<<<<< HEAD
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS =
  [ [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2] ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  # def over?
  #   if board.full?
  # end
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      #cycles through WIN_COMBINATIONS i.e. [0,1,2], then [3,4,5], then [6,7,8]
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      #then gets values at each of these cells
      position_1 = board.cells[win_index_1] #could be "X", "O", or " "
      position_2 = board.cells[win_index_2] #could be "X", "O", or " "
      position_3 = board.cells[win_index_3] #could be "X", "O", or " "

      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
        return win_combination
      end
    end
    false
  end

# more elegant solution
  # def won?
  #   winning_array = Game::WIN_COMBINATIONS::WIN_COMBINATIONS
  #   winning_array.detect do |combo|
  #     board.cells[combo[0]] == board.cells[combo[1]] &&
  #     board.cells[combo[1]] == board.cells[combo[2]] &&
  #     board.taken?(combo[0] + 1)
  #   end
  # end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? board.cells[won?.first] : nil
  end

  def turn
    player_input = current_player.move(board) #where board is a pointless argument
    #move just asks for a player input from a specific player
    if board.valid_move?(player_input)
      board.update(player_input, current_player)
      board.display
    else
      turn
    end
  end

  # def turn
  #   puts "Please enter 1-9:"
  #   input = gets.strip
  #   spot = input_to_index(input)
  #   x_or_o = current_player
  #   if (valid_move?(spot))
  #     move(spot,x_or_o)
  #     display_board
  #   else
  #     turn
  #   end
  # end

  def play
=======

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
>>>>>>> 693bbff0765227f35a4baed302b8bae3490b5580
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end

<<<<<<< HEAD
  def start # a blank test spec for this...
  end

end
=======



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




>>>>>>> 693bbff0765227f35a4baed302b8bae3490b5580
