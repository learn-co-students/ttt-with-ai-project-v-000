#!/usr/bin/env ruby

require_relative '../config/environment'

n_players = ''

puts "Welcome to Tic-Tac-Toe!"
loop do
    puts "How many human players? (Enter 0 - 2)"
    n_players = gets.strip.to_i
    if n_players >= 0 && n_players <= 2
        break
    else
        puts "Invalid input."    
    end
    
end

case n_players
    when 0
        game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"))
    when 1
        
        puts "Just you? Okay."
        loop do
        puts "Do you want to be Xs or Os? (Enter 1 for Xs and 2 for Os)"
        n = gets.strip
            if n == "1"
                game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
                break
            elsif n == "2"
                game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
                break
            else
                "Invalid input"
            end
        end

    when 2
        puts "Two of you? Cool."
        puts "Xs go first"
            
        game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
    else 
    game = Game.new
end

game.play