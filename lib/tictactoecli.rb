def play_game
  "Welcome! Let's play Tic Tac Toe!"
  "What kind of game would you like to play: 0, 1- or 2-player?"
  "Please press '0' for 0 player, '1' for 1 player or '2' for 2 player."
  input = gets.strip
  "Who will go first and be player 'X'?"
  user_input = gets.strip
  user_input = Game.new
    while game.over
      "Would you like to play again?"
    end
  new_input = gets.strip
    if new_input = "Y" || "yes"
      Game.new
    else
      exit
    end
end