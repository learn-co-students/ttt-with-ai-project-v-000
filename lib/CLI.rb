#class CLI
#
#  def call
#    #number of players
#    puts "Would you like to play with 0, 1, or 2 players?"
#    number_of_players = gets.strip.to_i
#    #find out which token starts
#    puts "Who should go first, 'X' or 'O'?"
#    starting_token = gets.strip
#
#    if starting_token == 'O'
#      opposing_token = 'X'
#    else
#      opposing_token = 'O'
#    end
#
#    #set up game
#    if number_of_players == 0
#        game = Game.new(Players::Computer.new(starting_token), Players::Computer.new(opposing_token), Board.new)
#    elsif number_of_players == 1
#      puts "Should player 1 be a computer or a human?"
#      answer = gets.strip.downcase
#
#      if answer == "computer"
#          #game = Game.new(Players::Computer.new(starting_token), Players::Human.new(opposing_token), Board.new)
#          #def computer_v_computer
#            puts "Regular or Wargames?"
#            input = gets.chomp.downcase
#
#            if input == "regular"
#              game = Game.new(Players::Computer.new(starting_token), Players::Computer.new(opposing_token))
#              game.play
#            elsif input == "wargames"
#              games_won = 0
#              100.times do |game|
#                game = Game.new(Players::Computer.new(starting_token), Players::Computer.new(opposing_token))
#                result = game.play
#                if result == "won"
#                  games_won += 1
#                end
#              end
#              puts "The computer won #{games_won} out of 100 games."
#            end
#          #end
#      elsif answer == "human"
#          game = Game.new(Players::Human.new(starting_token), Players::Computer.new(opposing_token), Board.new)
#      end
#    else
#      game = Game.new(Players::Human.new(starting_token), Players::Human.new(opposing_token), Board.new)
#    end
#    game.play
#  end
#
#end
