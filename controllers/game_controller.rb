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
            one_player_mode
        when '0'
            zero_player_mode
        when 'q'
            puts "Thanks for playing! Good bye."
            exit
        else
            puts "You have not selected a valid option."
            main_menu
        end
    end

    def two_player_mode
        puts "This is two player mode. The object of the game is to get three"
        puts "in a row either diagonally or horizontally. The game is done when a"
        puts "player has won or all 9 squares are filled.\n"
        game = Game.new
        game.play
        play_again?
    end

    def one_player_mode
        puts "Who should go first to put X down? Enter 1 to go first or 0 for computer to go first."
        input = gets.strip
        if input == '1'
          game = Game.new(Players::Human.new('X'),Players::Computer.new('O'))
        elsif input == '0'
          game = Game.new(Players::Computer.new('X'),Players::Human.new('O'))
        end
        game.play
        play_again?
    end

    def zero_player_mode
        puts "This is zero player mode where 2 computers play against each other."
        game = Game.new(Players::Computer.new('X'),Players::Computer.new('O'))
        game.play
        play_again?
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
