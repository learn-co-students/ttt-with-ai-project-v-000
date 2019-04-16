
class TicTacToeCLI
  def initialize
  end

  def call
    puts "Welcome to Tic Tac Toe! How many human players [0,1,2] will participate?: "
    input = gets.strip.to_i

    #determine who will go first
    if input == 1
      puts "Great! Will you or the computer go first? [me,computer]? "
      first = gets.strip
      if first == "me"
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Computer.new("O")
      else
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Human.new("O")
      end
    end

    #create Game instance based on user input
    if input == 0
      @new_game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"),Board.new)
    elsif input == 1
      @new_game = Game.new(@player_1,@player_2,Board.new)
    else
      @new_game = Game.new(Players::Human.new("X"),Players::Human.new("O"),Board.new)
    end

    #play the Game
    @new_game.play
  end
end
