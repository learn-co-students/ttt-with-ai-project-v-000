class Board

    attr_accessor :cells
    #you need to tell it to read and write the information (data) you give (parse) it

    def reset!
        @cells = Array.new(9," ")
    end
    #after you give it data, it needs to be able to reset to start a new game


    def initialize
        reset!
    end
    #when each game is started it initialzes with an array of 9 empty @cells


    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end
    #these empty cells need to be able to display
    
    
    def position(input)
        cells[input.to_i - 1]
    end
    #convert user input to array
    
    
    def full?
        cells.none? do |token|
            token == " "
        end
    end
    #returns true for full board
    
    
    def turn_count
        counter = 0
        cells.each do |index|
            if index != " "
                counter += 1
            end
        end
        counter
    end
    #returns the amount of turns
    
    
    def taken?(input)
        (position(input) == "X" || position(input) == "O")
    end
    #returns true if the input is X or O
    
    
    def valid_move?(input)
        (input.to_i.between?(1,9) && !taken?(input))
    end
    #returns true for user input between 1-9 && that is !not taken
    
    def update(input, player)
        @cells[to_index(input)] = player.token
    end
    #updates the cells in the board with the player token according to the input
    
    def to_index(input)
        input.to_i - 1
    end
    #define to_index method sfor update method
  
end
