#!/usr/bin/env ruby
require_relative '../config/environment'

def GameController
    def start
        puts " Welcome to Tic Tac Toe!"
        main_menu
    end

    def main_menu
        # List the kinds of game available
        # Prompt the user for what kind of game they want to play, 0,1, or 2 player.
        # Give them the option to quit the game
        gets.strip
        case(type)
        when '2'
            puts "This feature is not yet available. Please try again later."
            # two_player_mode
        when '1'
            puts "This feature is not yet available. Please try again later."
            # one_player_mode
        when '0'
            puts "This feature is not yet available. Please try again later."
            # zero_player_mode
        when 'q'
            puts "Thanks for playing! Good bye."
            exit
        else
            puts "You have not selected a valid option."
            puts "Please enter a number (0-2) or 'q' to quit."
            main_menu
        end
    end

    def two_player_mode
        # display the mode type and rules of the game
        # start a game with two human players
        # ask the user if they want to play again
        # If yes, run another game.
        # If the user doesn't want to play again, exit the program.
    end

    def one_player_mode
        # Ask the user for who should go first and be "X".
        # start a game with a human player vs a computer player
        # ask the user if they want to play again
        # If yes, run another game.
        # If the user doesn't want to play again, exit the program.
    end

    def zero_player_mode
        # display the mode type and rules of the game
        # start a game with 2 computer players
        # ask the user if they want to play again
        # If yes, run another game.
        # If the user doesn't want to play again, exit the program.
    end

end

