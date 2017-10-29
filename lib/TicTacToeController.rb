class TicTacToeController

  def initialize
    puts "Welcome to Tic Tac Toe. Let's play!"
  end

  def call
    input = ""
    while input != "exit"
      puts "How many players do you want to play with? Enter 0, 1, or 2."
      input = gets.strip
      case input
      when "0"
          puts "Starting new game with 0 players. Please enter a move between 1 and 9."
          zero_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
          zero_game.play
          puts "Would you like to play again? Enter 'Yes'. If not, enter 'Exit'."
          input = gets.strip
          when "exit"
          break
      when "1"
          puts "Starting new game with 1 player. Please enter a move between 1 and 9."
          one_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
          one_game.play
          puts "Would you like to play again? Enter 'Yes'. If not, enter 'Exit'."
          input = gets.strip
          when "exit"
          break
      when "2"
          puts "Starting new game with 2 players. Please enter a move between 1 and 9."
          two_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
          two_game.play
          puts "Would you like to play again? Enter 'Yes'. If not, enter 'Exit'."
          input = gets.strip
          when "exit"
          break
      # when "wargames"
      #   puts "Starting new game with 0 players...100 times!"
      #   zero_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      #   count = 0
      #   while count <= 100
      #     zero_game.play
      #     count +=1
      #   end
        end

    end
  end


  #should i put end of game in a method in Game class?
  #how to add logic to computer - play move 1, 3 or 7 and 9



end 
