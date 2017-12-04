module Players
    class Computer < Player
        
        attr_accessor :player_1, :player_2, :board

        def move(player_1 = Players::Computer.new, player_2 = Players::Computer.new)
        end 
    end
end 

