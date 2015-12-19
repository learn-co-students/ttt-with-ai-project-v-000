class Start

  def initialize

    puts "Welcome to Tic Tac Toe!"

    puts "How many Players: 0, 1 or 2?"

    players = gets.strip.to_i

    puts "Who wants to go first: Player 1 - X or Player 2 - O"

    first = gets.strip.to_i

    if players == 0 && first == 1
      game = Game.new(player_1=Computer.new("X"), player_2=Computer.new("O"), board=Board.new)
    elsif players == 0 && first == 2 
      game = Game.new(player_1=Computer.new("O"), player_2=Computer.new("X"), board=Board.new)
    elsif players == 1 && first == 1 
      game = Game.new(player_1=Human.new("X"), player_2=Computer.new("O"), board=Board.new) 
    elsif players == 1 && first == 2
      game = Game.new(player_1=Human.new("O"), player_2=Computer.new("X"), board=Board.new)
    elsif players == 2 && first == 1
      game = Game.new(player_1=Human.new("X"), player_2=Human.new("O"), board=Board.new) 
    else
      game = Game.new(player_1=Human.new("O"), player_2=Human.new("X"), board=Board.new)
    end 

    board.display
    game.play 

  end  
end  