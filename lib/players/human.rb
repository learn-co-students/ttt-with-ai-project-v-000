class Players::Human < Player
    attr_accessor :name


    def initialize(name)
        super
        @name = name

    end

    def move(board)

        puts "Where would you like to move? (enter 1 - 9)"

        gets.strip

    end

end
