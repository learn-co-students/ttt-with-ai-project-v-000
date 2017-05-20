class TicTacToeCLI
  def initialize
  end

  def call
  	puts "Welcome to Tic Tac Toe"

	while true do
		puts "What kind of game they want to play, 0,1, or 2 player?"
		puts "Enter 0, 1, 2, or exit"
		user_input = gets.chomp

		break if user_input == 'exit'
		new_game = Game.new if user_input == "2"
		new_game = Game.new(Players::Computer.new('X'), Players::Computer.new('O')) if user_input == "0"

		if user_input == "1"
			puts "Who shall start? Enter 1 for Computer, or 2 if you want to begin."
			choice = gets.chomp
			new_game = Game.new(Players::Human.new('X'), Players::Computer.new('O')) if choice == '2'
			new_game = Game.new(Players::Computer.new('X'), Players::Human.new('O')) if choice == '1'
		end

		new_game.play
		
	end   
  end
end
