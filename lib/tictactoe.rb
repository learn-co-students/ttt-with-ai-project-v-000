# Prompt the user for what kind of game they want to play, 0,1, or 2 player
require 'pry'

class Tictactoe
  def self.play_tic_tac_toe
    puts "How many players do you want in your game 0,1, or 2?"
    amount_of_players = gets.strip
    if amount_of_players == "0"
      self.computer_vs_computer
    elsif amount_of_players == "1"
      self.human_vs_computer
    elsif amount_of_players == "2"
      self.human_vs_human
    elsif amount_of_players == "wargames"
      self.wargames
    end
  end #method

  def self.computer_vs_computer
    player_1 = Players::Computer.new("X")
    player_2 = Players::Computer.new("O")
    game = Game.new(player_1, player_2)
    game.play
    puts "Do you want to play again(Yes or No)?"
    play_again = gets.strip
    if play_again == "yes" || play_again == "Yes"
      self.play_tic_tac_toe
    elsif play_again == "no" || play_again == "No"
      "Thanks for playing!"
    end
  end

  def self.human_vs_human
    player_1 = Players::Human.new("X")
    player_2 = Players::Human.new("O")
    game = Game.new(player_1, player_2)
    game.play
    # game.play_again
    puts "Do you want to play again(Yes or No)?"
    play_again = gets.strip
    if play_again == "yes" || play_again == "Yes"
      self.play_tic_tac_toe
    elsif play_again == "no" || play_again == "No"
      puts "Thanks for playing!"
    end
  end

  def self.human_vs_computer
    puts "Who goes first and is X (Human or Computer)"
    who_goes_first = gets.strip
    if who_goes_first == "Human" || who_goes_first == "human"
      player_1 = Players::Human.new("X")
      player_2 = Players::Computer.new("O")
      game = Game.new(player_1, player_2)
      game.play
      puts "Do you want to play again(Yes or No)?"
      play_again = gets.strip
      if play_again == "yes" || play_again == "Yes"
        self.play_tic_tac_toe
      elsif play_again == "no" || play_again == "No"
        "Thanks for playing!"
      end
    elsif who_goes_first == "Computer" || who_goes_first == "computer"
      player_1 = Players::Computer.new("X")
      player_2 = Players::Human.new("O")
      game = Game.new(player_1, player_2)
      game.play
      puts "Do you want to play again(Yes or No)?"
      play_again = gets.strip
      if play_again == "yes" || play_again == "Yes"
        self.play_tic_tac_toe
      elsif play_again == "no" || play_again == "No"
        "Thanks for playing!"
      end #if
    end #if
  end #method

  def self.wargames #extra fun thing to make. Returns the amount of times the AI wins playing itself. 
    player_1 = Players::Computer.new("X")
    player_2 = Players::Computer.new("O")
    games_won = 0
    games_played = 0
    game = Game.new(player_1, player_2)
    until games_played == 100
      game.play
      games_played += 1
      if game.won?
        games_won += 1
      end #if
    end #until
    puts "#{games_won}"
  end #method

end
