class TicTacToeCLI

  def initialize
  end

  def call
      play_again= ""
      until play_again == "n"
        puts "*** Welcome to Tic Tac Toe ***"
        puts "What kind of game do you want to play? 0,1, or 2 player."

        kind = gets.strip

          if kind == "2"
            puts "Who should go first? X or O."
            first_player = gets.strip.downcase
              case first_player
                when "x"
                  Game.new.play
                when "o"
                  Game.new(Player::Human.new("O"), Player::Human.new("X"), Board.new).play
              end
            
              puts "Do you want to play again (y/n)?."
              play_again = gets.strip
                
          elsif kind =="1"
                  puts "Who should go first? X(computer) or O(you)."
                    first_player = gets.strip.downcase
                  case first_player
                    when "x"
                      Game.new(Player::Computer.new("X"), Player::Human.new("O"), Board.new).play
                    when "o"
                      Game.new(Player::Human.new("O"), Player::Computer.new("X"), Board.new).play
                  end
                  puts "Do you want to play again (y/n)?."
                  play_again = gets.strip
                

          elsif kind =="0"
                  
                  Game.new(Player::Computer.new("X"), Player::Computer.new("O"), Board.new).play
                  puts "Do you want to play again (y/n)?."
                  play_again = gets.strip
          end
      end
  end

end