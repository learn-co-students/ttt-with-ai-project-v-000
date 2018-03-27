class CLI

  def initialize
    2.times{puts''}
    puts "Welcome to Tic Tac Toe (that's Noughts & Crosses to the rest of us)!"
    puts "Who is playing today?"
    puts ""
    self.class.continue
  end

  def self.play_again
    2.times{puts''}
    puts "Great, let's go again"
    puts "Who is playing this time?"
    puts ""
    continue
  end

  def self.continue
    puts ""
    puts "Enter 1, 2 or 3:"
    puts '1. Player vs. Player'
    puts '2. Player vs Computer'
    puts '3. Computer vs Computer'
    puts ""
    puts "To leave it for today just say goodbye!"
    puts 'or for a cheeky extra try... Winter is coming!..'
    puts ""
    user_input = gets.strip
    # if user_input == "wargames"
    #   wargames
    # else
      case user_input.downcase
        when "1"
          Game.new().play
          again_again?
        when "2"
          Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
          again_again?
        when "3"
          Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
          again_again?
        when /winter is coming/
          wargames
          Game.play_again?
        when /bye/
          puts "See you next time!"
          sleep 1
          exit!
        else
          2.times{puts ""}
          puts "Sorry, what did you say?"
          continue
      # end
    end
  end

  def self.wargames
    winners = []
    10.times{puts ""}
    puts 'Winter is here! A fight to the death between the Night King and our saviour, Jon Snow!'
    x = ""
    while !valid_warrior?(x)
      puts 'Who will make the first move? Jon Snow or The Night King?'
      10.times{puts ""}
      x = gets.strip
    end
    x.downcase == "jon snow" ? o = "The Night King" : o = "Jon Snow"
    sleep 1
    puts ""
    puts "Preparing for Winter..."
    sleep 2
    100.times do
      current_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      current_game.play
      winners << current_game.winner
    end
    6.times{puts''}
    wargames_over(x, o, winners)
  end

  def self.valid_warrior?(warrior_x)
    warrior_x.downcase == "jon snow" || warrior_x == "the night king"
  end

  def self.wargames_over(x, o, winners)
    puts 'Winter is over!'
    3.times{puts''}
    x_wins = winners.find_all{ |winner| winner == 'X'}
    o_wins = winners.find_all{ |winner| winner == 'O'}
    puts "After 100 battles, #{x.split.map(&:capitalize).join(' ')} won #{x_wins.length} times and #{o} won #{o_wins.length} times. There were #{100 - o_wins.length - x_wins.length} draws."
    again_again?
  end


  def self.again_again?
    3.times{puts ""}
    puts "Would you like to play again? y/n"
    input = gets.strip
    input == "y" ? play_again : exit!
  end

end
