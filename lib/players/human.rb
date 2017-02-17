module Players
    class Human < Player
        attr_accessor :name
        
    def initialize(name)
        @name = name
    end
        
    def move(board)
        puts "Where would you like to move? (enter 1 -9)"
        move = gets.chomp
    end
        
    end
end