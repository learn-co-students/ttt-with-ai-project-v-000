require 'pry'

class CLI

  def call
    start
  end

  #Ask what type of game they want to play
  def start
    puts "Welcome to Tic Tac Toe."
    play_again = "yes"
    while play_again.downcase == "y" || play_again.downcase == "yes"
      valid_options_1 = ["0", "1", "2"]
      question_1 = puts "What type of game do you want to play? (0, 1, or 2 players)"
      input_1 = gets.strip
      until valid_options_1.include? input_1
        puts "That's not a valid option, please enter 0, 1, or 2."
        question_1
        input_1 = gets.strip
      end

      if input_1.to_i == 0
        player_1 = Players::Computer.new("X")
        player_2 = Players::Computer.new("O")
        Game.new(player_1, player_2).play
      elsif input_1.to_i == 1
        puts "Would you like to go first and be X?"
        answer = gets.strip
        if answer.downcase == "yes" || answer.downcase == "y"
          player_1 = Players::Human.new("X")
          player_2 = Players::Computer.new("O")
          Game.new(player_1, player_2).play
        else
          player_1 = Players::Computer.new("X")
          player_2 = Players::Human.new("O")
          Game.new(player_1, player_2).play
        end
      elsif input_1.to_i == 2
        player_1 = Players::Human.new("X")
        player_2 = Players::Human.new("O")
        Game.new(player_1, player_2).play
      end
      puts "Would you like to play again?(Yes or No)"
      play_again = gets.strip
      if play_again.downcase == "no" || play_again.downcase == "n"
        puts "Goodbye, play again soon!"
      end
    end
  end
end
