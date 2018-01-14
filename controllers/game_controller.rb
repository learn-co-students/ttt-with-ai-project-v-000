#!/usr/bin/env ruby
require_relative '../config/environment'

class GameController
    def start
        puts " Welcome to Tic Tac Toe!"
        main_menu
    end

    def main_menu
        puts "What kind of game would you like to play?"
        puts "0  --Watch the computer play itself"
        puts "1  --Play against the computer"
        puts "2  --Play with a friend"
        puts "Enter a number to start a game. Enter 'q' to exit."
        selection = gets.strip
        case(selection)
        when '2'
            two_player_mode
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
        game = Game.new

        puts "This is two player mode. The object of the game is to get three" 
        puts "in a row either diagonally or horizontally. The game is done when a"
        puts "player has won or all 9 squares are filled."
        game.play
    end

    def one_player_mode
        # Ask the user for who should go first and be "X".
        # start a game with a human player vs a computer player
        # ask the user if they want to play again
        # If yes, run another game.
        #If the user doesn't want to play again, exit the program.
    end

    def zero_player_mode
        # display the mode type and rules of the game
        # start a game with 2 computer players
        # ask the user if they want to play again
        # If yes, run another game.
        # If the user doesn't want to play again, exit the program.
    end

    def play_again?
        puts "Do you want to play again? y/n "
        selection = gets.strip.downcase
        if selection == 'y' 
            main_menu
        else
            puts "Thanks for playing! Good bye."
            exit
        end
    end

end

