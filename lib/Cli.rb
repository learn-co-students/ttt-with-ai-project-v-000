class Cli

  def start_game_and_play
    puts "What kind of game you want to play? 0,1,2"
    puts "0 : AI 1 vs AI 2player 1 vs player 2"
    puts "1 : player vs AI"
    puts "2 : player 1 vs player 2"
    kind_of_game = gets.chomp
    self.choose_game(kind_of_game)
  end

  def choose_game(input)
    case input
      when "0"
        Game.new(Players::Computer.new("X"),Players::Computer.new("O"))
      when "1"
        Game.new(Players::Human.new("X"),Players::Computer.new("O"))
      when  "2"
        Game.new(Players::Human.new("X"),Players::Human.new("O"))
    end
  end

  def trigger
    if start_game_and_play.over?
      puts "Would you like to play again?\n Y or N"
      answer = gets.chomp.upcase
      start_game_and_play if answer == "Y"
    else
      start_game_and_play.play
    end
  end
end
