class App
  
  def start
    puts "Welcome to this awesome game of Tic Tac Toe!"
    puts "\n"
    welcome
  end
  
  def welcome
    puts "How many players do we have today?"
    puts "0: just watch the computers fight!"
    puts "1: one player (good luck to you!)"
    puts "2: two players (heh, easiest of all games)"
    response = gets.strip
    
    if response == "0"
      new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O")) 
    elsif response == "1"
      new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O")) 
    end
    
    new_game.play
  end
end