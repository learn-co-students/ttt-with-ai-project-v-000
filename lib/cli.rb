class Cli
  @game  = nil

  def call
    puts "Welcome to Tic Tac Toe!"
    choose_game

    if @game
      @game.play
    end
  end

  def choose_game
    input = nil
    puts "What kind of game would you like to play?"
    puts "Enter 0 for Computer vs Computer"
    puts "Enter 1 for Computer vs Human"
    puts "Enter 2 for Human vs Human"
    puts "To quit, type 'exit'."
    puts "To start over, type 'new game'."
    puts "What would you like to do?"

    input = gets.strip

    case input
    when "0"
      @game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'))
    when "1"
      @game = Game.new(Players::Human.new('X'), Players::Computer.new('O'))
    when "2"
      @game = Game.new(Players::Human.new('X'), Players::Human.new('O'))
    when "exit"
      puts 'Goodbye!'
    when "new game"
      Board.reset!
    end
  end
end
