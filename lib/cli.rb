class CLI

def call
  puts "Welcome to Vane's Tic-Tac_toe!!!"
  puts 'Do you want to play 1. Player vs Player 2. Player vs Computer or 3. Computer vs Computer'
  # puts 'Please enter game.new(player, player, board), game.new(player, computer, board) or game.new(computer, computer, board)
  answer = gets.strip

  if answer == '1'
    game = Game.new()
    game.board.display
  elsif answer == '2'
    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    game
  else
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    game
  end
  game.play
end

end