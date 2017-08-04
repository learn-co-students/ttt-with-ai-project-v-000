class SelectGame

def select
puts "Welcome to Tic Tac Toe!"
puts "What type of game would you like to play?"
puts "Type 'wargames' for 100 rounds of computer simulations."
puts "Type 'challenge' to play against the computer"
  #if challenge, be sure to ask which player they want to be, with a default to player 1 if they do not specify
puts "Type 'duel' to play against a friend"
user_input = gets.strip
case user_input
when "wargames"
  counter = 0
  while counter < 101
    Games::Wargames.new
    Games::Wargames.new.play
    counter += 1
  end
    Games::Wargames.results
    play_again?

when "challenge"
    puts "Who would you like to be? Type '1' for Player 1 (X) or '2' for Player 2 (O)"
      new_player = gets.strip
      if new_player == "2"
        Games::Challenge.new(player_1 = Players::Computer.new("X")).board.display
        Games::Challenge.new(player_1 = Players::Computer.new("X")).play
      else
        Games::Challenge.new.board.display
        Games::Challenge.new.play
      end #if statement challenge
      play_again?
when "duel"
    Game.new.board.display
    Game.new.play
    play_again?
  when "exit"
    exit
else
  select
end #case statement
end #method

def play_again?
  puts "Play again? y/n"
    decision = gets.strip
    if decision == "y"
      select
    elsif decision == "n"
      exit
    else
      play_again?
    end
  end

end #class
