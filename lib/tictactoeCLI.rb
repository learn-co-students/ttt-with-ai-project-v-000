class TicTacToeCLI
  def initialize
    puts "Hey, welcome to Tic-Tac-Toe!"
    puts "To quit, type 'quit'."
  end

  def start
    puts "How many players? Enter 0, 1, or 2."
    input = gets.chomp
    if input == 'quit'
      exit
    elsif input == "0"
      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
    elsif input == "1"
      puts "You chose to play against the computer. The following board will display your possible positions to move:"
      puts "\n"
      puts " 1 | 2 | 3 "
      puts "------------"
      puts " 4 | 5 | 6 "
      puts "------------"
      puts " 7 | 8 | 9 "
      puts "\n"
      puts "Who will start the game, human or computer?"
      input = gets.chomp
        if input == 'quit'
          exit
        elsif input == "human"
          Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
        elsif input == "computer"
          Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
        end
    elsif input == "2"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
    end
    play_again?
  end


  def play_again?
  puts "Would you like to play again? Enter y/n or 'wargames' to see the computer vs. computer showdown."
  input = gets.chomp
  if input == "y"
    self.start
  elsif input == "n"
    puts "Thanks for playing! Come back soon."
  elsif input == "wargames"
    won_games = 0
    100.times do |game|
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
      if game == "won"
        won_games += 1
      end
    end
    puts "The computer beat the computer #{won_games} times out of 100! Quite the battle."
    play_again?
  end
  end

end
