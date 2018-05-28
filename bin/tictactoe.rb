#!/usr/bin/env ruby

require_relative '../config/environment'

input = ""
playerX = Players::Human.new("X")
playerO = Players::Human.new("O")
computerX = Players::Computer.new("X")
computerO = Players::Computer.new("O")

puts "Welcome Tic Tac Toe!"
puts "Please enter your game mode"
puts "'1' for Single Player, '2' for Versus, '0' for Computer, or 'war games' for a 100 game simulation between 2 computers"

while input != "exit"
  board = Board.new
  input = gets.strip
  input = input.downcase
  game_completed = false
  case input
  when input != "1" || input != "0" || input != "2" || input != "war games"
    puts "Invalid Selection please chose again"
    puts "Please enter your game mode"
    puts "'1' for Single Player, '2' for Versus, '0' for Computer, or 'war games' for a 100 game simulation between 2 computers"
  when "1"
    puts "Do you want to go first? yes or no?"
    input_two = ""
    input_two = gets.strip
    if input_two.downcase == "yes"
      game = Game.new(playerX, computerO, board)
    elsif input_two.downcase == "no"
      game = Game.new(computerX, playerO, board)
    end
    #start game with human player as X if yes as O if no
  when "2"
    puts "Two players selected. X goes first"
    #start game with 2 human players
    game = Game.new(playerX, playerO, board)
    game.play

  when "0"
    puts "Watch and learn. Computer Mode selected"
    game = Game.new(computerX, computerO, board)
    game.play
    #start game with 2 computer players
  when "war games"
    #Plays game then refrences war games
    games_played=0
    xwins = 0
    owins=0
    draws=0
    while games_played <100
      game = Game.new(computerX, computerO, board)
      game.play
      if game.draw?
        draws += 1
      elsif game.winner == "X"
        xwins +=1
      else
        owins +=0
      end
      games_played = games_played + 1
    end
    puts "X wins:#{xwins} O wins:#{owins} Draws:#{draws}"
    puts "Strange game, the only winning move is not to play"
  end
  if game_completed == true
    puts "play again?"
    game_completed= false
    puts "Invalid Selection please chose again"
    puts "Please enter your game mode"
    puts "'1' for Single Player, '2' for Versus, '0' for Computer, or 'war games' for a 100 game simulation between 2 computers"
  end
end
