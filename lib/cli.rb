class TicTacToeCLI
  def initialize
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    puts "How many players are there? Enter 0, 1, or 2 or wargames."
    input = gets.strip

    if input == "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      puts "Good luck!"
      game.board.display
      game.play

    elsif input == "1"
      puts "You go first: Your token is X!"
      game = Game.new(Human.new("X"), Computer.new("O"))
      puts "Good luck!"
      game.board.display
      game.play
    elsif input == "2"
      puts "Player X goes first..."
      game = Game.new
      game.board.display
      game.play
    elsif input == "wargames"
      100.times do
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      game.board.display
      game.play
    end
  end

	puts "Do you want to play again (y/n)? "
	return gets.strip == "y"
  end

  def call
	while play do # since play will return false if the user does not enter "y" we can use a while loop to keep calling the funciton...
	  # I can use this loop to do things like keep track of how many games the user played
	end
	puts "Goodbye!"
  end

end
