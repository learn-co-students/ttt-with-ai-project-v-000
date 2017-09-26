require_relative './text.rb'

def menu
  include Text
  celebrate_text
  menu_prompts
  input = gets.chomp

  case input
  when "1" then Game.new.play
  when "2" then Game.new(
    player_1 = Players::Human.new("X"),
    player_2 = Players::Computer.new("O")
  ).play
  when "3" then Game.new(
    player_1 = Players::Computer.new("X"),
    player_2 = Players::Computer.new("O")
  ).play
  when "exit" then exit
  else menu
  end
end
