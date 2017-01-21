class TicTacToeCLI
  def call
    puts "Welcome to Tic Tac Toe!\n"
    play_again = 'yes'

    while play_again == 'yes' || play_again == 'y'
      puts "How many human players? (0, 1, or 2)"
      input = gets.strip

      if input == '0'
        ai1 = Players::Computer.new('X')
        ai2 = Players::Computer.new('O')
        game = Game.new(ai1, ai2)
        game.play
      elsif input == '1'
        puts "Who should go first? (human or computer)"
        input = gets.strip
        if input == 'human'
          human = Players::Human.new('X')
          ai = Players::Computer.new('O')
          game = Game.new(human, ai)
          game.play
        elsif input == 'computer'
          human = Players::Human.new('O')
          ai = Players::Computer.new('X')
          game = Game.new(ai, human)
          game.play
        else
          puts "Invalid input"
        end
      elsif input == '2'
        human1 = Players::Human.new('X')
        human2 = Players::Human.new('O')
        game = Game.new(human1, human2)
        game.play
      else
        puts "Invalid input"
      end

      puts "Play again? (yes or no)"
      play_again = gets.strip
    end

    puts "Goodbye!"
  end
end
