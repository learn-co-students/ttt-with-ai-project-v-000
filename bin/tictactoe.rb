#!/usr/bin/env ruby

require_relative '../config/environment'

def greeting
  puts "Welcome to CLI Tic Tac Toe"
  puts "Type C for computer or H for human:"
  puts "Who is the first player?"
  player_one = get_player
  puts "Who is the second player?"
  player_two = get_player
  
  player = {"c" => Players::Computer, "h" => Players::Human}
  start(player[player_one], player[player_two])
end

def start(first_player, second_player)
  Game.new(first_player.new("X"), second_player.new("O"), Board.new).play
end

def get_player
  choice = gets.strip.downcase
  until choice == "c" || choice == "h"
    puts "Type C for computer or H for human:"
    choice = gets.strip.downcase
  end
  choice
end

greeting
