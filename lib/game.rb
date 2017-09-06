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
		board.cells.include?(" ") == false
	end

	def won?
		winning_array = Game::WIN_COMBINATIONS::WIN_COMBINATIONS
		winning_array.detect do |combo|
			board.cells[combo[0]] == board.cells[combo[1]] &&
			board.cells[combo[1]] == board.cells[combo[2]] &&
			board.taken?(combo[0] + 1)
		end


				
	end

	def draw?
		if won?
			false
		elsif over?
			true
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

  	input = gets.chomp
  	board.valid_move?(input)

  end


  # describe 'turn' do
  #   it 'makes valid moves' do
  #     game = Game.new
  #     allow($stdout).to receive(:puts)

  #     expect(game.player_1).to receive(:gets).and_return("1")

  #     game.turn
  #   end

  #   it 'asks for input again after a failed validation' do
  #     game = Game.new
  #     allow($stdout).to receive(:puts)

  #     expect(game.player_1).to receive(:gets).and_return("invalid")
  #     expect(game.player_1).to receive(:gets).and_return("1")

  #     game.turn
  #   end

  #   it 'changes to player 2 after the first turn' do
  #     game = Game.new
  #     allow($stdout).to receive(:puts)

  #     expect(game.player_1).to receive(:gets).and_return("1")
  #     expect(game.player_2).to receive(:gets).and_return("2")

  #     game.turn
  #     game.turn
  #   end
  # end



end #end Game Class


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




