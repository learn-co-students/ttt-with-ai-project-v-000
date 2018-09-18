class TicTacToe
  attr_accessor :user_input
  def call
    puts '----------Welcome To TicTacToe -------------'

    self.user_input = ''
    error = 0
    until self.user_input == '3'
      if error == 0
        instruct(0)
      else
        instruct(1)
        error = 0
      end
      self.user_input = gets.strip
      case self.user_input
        when '0'
          ai_vs_ai
        when '1'
          player_vs_ai
        when '2'
          two_players
        when '3'
          self.user_input = '3' # Exit game
        else
          error = 1
      end
    end
  end

  private

  def instruct(p)
    puts "\nInvalid Input!\n\n" if p == 1
    puts 'Choose the type of TicTacToe you want to play!'
    puts '--> Enter 0 for a game between AI\'s'
    puts '--> Enter 1 for a game between Player and AI'
    puts '--> Enter 2 for a game between two Players'
    puts '--> Enter 3 to exit'
  end

  def ai_vs_ai
    Game.new(Players::Computer.new('X'), Players::Computer.new('O')).play
  end

  def player_vs_ai
    choice = []
    puts 'Choose your Token (Enter X or O)'
    choice[0] = gets.strip
    until %w(X x O o).include?(choice[0])
      puts 'Invalid Input!'
      puts 'Choose your Token (Enter X or O)'
      choice[0] = gets.strip
    end

    player2_token = choice[0].upcase == 'X' ? 'O' : 'X'

      player_1 = Players::Human.new(choice[0].upcase)
      player_2 = Players::Computer.new(player2_token)


    Game.new(player_1, player_2).play


  end

  def two_players
    puts 'Who should go first X or O (Enter X or O)'
    choice = gets.strip
    until %w(X x O o).include?(choice)
      puts 'Invalid Input!'
      puts 'Who should go first X or O (Enter X or O)'
      choice = gets.strip
    end
    player2 = choice.upcase == 'X' ? 'O' : 'X'
    Game.new(Players::Human.new(choice.upcase), Players::Human.new(player2)).play
    puts 'Do you want to play again? (Enter Y OR N)'
    choice = gets.strip
    if choice.upcase == 'Y'
      self.user_input = '-1'
    else
      self.user_input = '3'
    end
  end
end
