class CLI
    
    def call
        
      puts "Welcome"
      loop do
          
        puts "How many players? Type 'Exit' to exit."
        puts "0 Players - Computer vs Computer"
        puts "1 Player - Computer vs Human"
        puts "2 Players - Human vs Human"
        puts "Exit"
        
        input = gets.chomp
        case input
        when "0"
            computer_vs_computer
        when "1"
            human_vs_computer
        when "2"
            human_vs_human
        when "exit" || "Exit"
            break
        else
            #TO DO: restart the loop here
            restart
        end
      end
    end
    
      def computer_vs_computer
          game = Game.new(Player::Computer.new('X'), Player::Computer.new('O'))
          puts "Starting game...."
          game.play
      end
      
      def human_vs_computer
      end
      
      def human_vs_human
          puts "Player #1, would you like to play as X or O?"
          input = gets.chomp
          case input.downcase
            when 'x'
              game = Game.new(Players::Human.new('X'), Players::Human.new('O'))
            when 'o'
              game = Game.new(Players::Human.new('O'), Players::Human.new('X'))
            end
            game.play
      end
    
end