class CLI  
    def start
        puts "Welcome to Tic Tac Toe!"
        puts "How many players?"
        # 1 is a human playing against a computer.
        # 2 is two human players.
        # 0  is computer against another computer
        input = gets.strip
        # Use the input to initialize a Game with the appropriate player types and token values.
        if input == 1
            Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        elsif input == 2
            Game.new(Players::Human.new("X"), Players::Human.new("O"))
        else 
            input == 0
            Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        end
        
    end

end