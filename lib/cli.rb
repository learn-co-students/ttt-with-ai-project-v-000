class CLI
  def start
    puts "Welcome to Tic Tac Toe!"
    another_round = ""
    until another_round.downcase == "n" || another_round.downcase == "no"
      puts "Select one of Three Options to Play:"
      puts "Option 0: Computer will play itself"
      puts "Option 1: Play against Computer"
      puts "Option 2: Play against an Opponent"
      reply = gets.strip

      if reply.to_i < 0 || reply.to_i > 3
        reply = gets.strip
      elsif reply.to_i == 0
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      elsif reply.to_i == 1
        puts "Who will go first? (enter Human or AI)"
        reply = gets.strip
        if reply == "Human"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
          puts "You are player X!"
        elsif reply == "AI"
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
          puts "You are player O!"
        end
        game.play until game.over?
      elsif reply.to_i == 2
        game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
        puts "Player 1 is X. Player 2 is O"
      end
      game.play until game.over?
      puts "Game Over. Another Round? (enter Yes or No)"
      another_round = gets.strip
    end
  end
end
