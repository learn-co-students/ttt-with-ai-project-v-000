class TicTacToeCLI
  def call
    puts "Welcome to Tic Tac Toe!"
    puts "What player game would you like to play? (0-2)"
    puts "Which player should go first and have a token of 'X'? (1 or 2)"
    puts "For example, write as: 1, 1"
    input = gets.strip.split(",").map(&:to_i)

    case input
    when [0, 1]
      game = Game.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
    when [0, 2]
      game = Game.new(player_1=Players::Computer.new("O"), player_2=Players::Computer.new("X"), board=Board.new)
    when [1, 1]
      game = Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
    when [1, 2]
      game = Game.new(player_1=Players::Compuyer.new("O"), player_2=Players::Human.new("X"), board=Board.new)
    when [2, 1]
      game = Game.new(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    when [2, 2]
      game = Game.new(player_1=Players::Human.new("O"), player_2=Players::Human.new("X"), board=Board.new)
    end

    game.play

    puts "Would you like to play again?(Y/N)"
    input = gets.strip.upcase
    if input == "Y"
      start
    else
      exit
    end
  end
end
