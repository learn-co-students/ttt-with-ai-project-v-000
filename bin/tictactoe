# !/usr/bin/env ruby

require_relative '../config/environment'

puts "Welcome to Tic Tac Toe!"

def start
puts "How many players do we have? (Choose 0 - 2)"

input = gets.chomp.to_i
until input == 0 || input == 1 || input == 2
input = gets.to_i
end
case input
when 0
  puts "Wargames!!!! X100"
  player_1 = Players::Computer.new("X")
  player_2 = Players::Computer.new("O")
  game = Game.new(player_1, player_2)
when 1
  puts "Player 1 vs Computer 1!"
  player_1 =  Players::Human.new("X")
  player_2 =  Players::Computer.new("O")
  game = Game.new(player_1, player_2)
when 2
  puts "Player 1 vs Player 2!"
  player_1 = Players::Human.new("X")
  player_2 = Players::Human.new("O")
  game = Game.new(player_1, player_2)
end

until game.over?
  game.play
end

end
start

play_again = ""
until play_again.downcase =~ /^(n|no)$/
  puts "Would you like to play gain?"
  play_again = gets.strip
  if play_again.downcase =~ /^(y|yes)$/
    start
  end
end
