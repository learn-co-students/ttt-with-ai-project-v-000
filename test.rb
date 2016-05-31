require_relative './config/environment'

def player_number
  puts "How many player(s) for this game (0, 1 or 2 players)?"
  number_players = gets.strip.to_i
  number_players.between?(0,2) ? number_players : player_number
end

player_number
