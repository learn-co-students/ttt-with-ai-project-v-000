class TicTacToeCLI
  def initialize
  end

  def call
    puts "Welcome to Tic Tac Toe!"
    puts "How many players are there? Enter 0, 1, or 2"
    input = gets.strip
    if input == "0"
      game = Game.new(Computer.new("X"), Computer.new("O"))
      puts "Good luck!"
      game.board.display
      game.play
    elsif input == "1"
      puts "Player 1 is X"
      game = Game.new(Human.new("X"), Computer.new("O"))
      puts "Good luck!"
      game.board.display
      game.play
    elsif input == "2"
      puts "Player 1 is X"
      game = Game.new
      puts "Good luck!"
      game.board.display
      game.play
    end
  end
  
end
