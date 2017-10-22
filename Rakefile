require_relative './config/environment.rb'
puts "Welcome to Tic Tac Toe..."

def reload!
  load './lib/board.rb'
  load './lib/game.rb'
  load './lib/player.rb'
  load './lib/players/computer.rb'
  load './lib/players/human.rb'
end

desc "A console"
  task :console do
    Pry.start
end
