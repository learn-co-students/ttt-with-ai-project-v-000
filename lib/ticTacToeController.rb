require 'pry'
class TicTacToeController
  include Players

  def call
    puts "Greetings user, It's time to play some TIC TAC TOE!"
    puts "Would you like to watch computer vs computer game?, enter 'watch computer'."
    puts "Would you like to play against the computer?, enter 'computer'."
    puts "Would you like to play against another player? enter 'player'."
    puts "type 'exit' to leave."
    puts "What would you like to do?"
    puts "\n"

    puts " 1 | 2 | 3 "
    puts "------------"
    puts " 4 | 5 | 6 "
    puts "------------"
    puts " 7 | 8 | 9 "

    while user_input = gets.chomp do

      if user_input == 'exit'
        break
      elsif user_input == 'watch computer'
        puts "----"
        puts "Who's 'X' computer 1 or computer 2?, enter '1' or '2'."
        user_choice = gets.chomp
        watch_computer(user_choice)
      elsif user_input == 'computer'
        puts "----"
        puts "Who's 'X' player 1 or computer 2?, enter '1' or '2'."
        user_choice = gets.chomp
        play_computer(user_choice)
      elsif user_input == 'player'
        puts "----"
        puts "Who's 'X' player 1 or player 2?, enter '1' or '2'."
        user_choice = gets.chomp
        play_player(user_choice)
      end
    end
  end

  def watch_computer(user_choice)
    user_choice = user_choice.to_i

    board = Board.new
    if user_choice == 1
      computer_player_1 = Computer.new("X")
      computer_player_2 = Computer.new("O")
    else
      computer_player_2 = Computer.new("X")
      computer_player_1 = Computer.new("O")
    end
    # binding.pry

    game = Game.new(computer_player_1,computer_player_2,board)
    game.play

    puts "enter 'yes' to watch again or 'exit' to go back to the main menu"
    user_response = gets.chomp
    if user_response == 'yes'
      watch_computer(user_choice)
    else user_response == 'exit'
      call
    end

  end

  def play_computer(user_choice)
    user_choice = user_choice.to_i

    board = Board.new
    if user_choice == 1
      player_1 = Human.new("X")
      computer_player_2 = Computer.new("O")

      game = Game.new(player_1,computer_player_2,board)
      game.play

    else
      computer_player_2 = Computer.new("X")
      player_1 = Human.new("O")

      game = Game.new(computer_player_2,player_1,board)
      game.play
    end

     puts "Enter 'yes' to play again or 'exit' to go back to the main menu"
     user_response = gets.chomp
     if user_response == 'yes'
       puts "who's 'X' player 1 or computer 2?, enter 1 or 2."
       user_response = gets.chomp
       play_computer(user_choice)
     elsif user_response == 'exit'
       call
     end

  end

  def play_player(user_choice)
    user_choice = user_choice.to_i

    board = Board.new
    if user_choice == 1
      player_1 = Human.new("X")
      player_2 = Human.new("O")
    else
      player_2 = Human.new("X")
      player_1 = Human.new("O")
    end

    game = Game.new(player_1,player_2,board)
    game.play

    puts "Enter 'yes' to play again or 'exit' to go back to the main menu"
    user_response = gets.chomp
    if user_response == 'yes'
      puts "who's 'X' player 1 or player 2?, enter 1 or 2."
      user_response = gets.chomp
      play_player(user_choice)
    elsif user_response == 'exit'
      call
    end

  end


end
