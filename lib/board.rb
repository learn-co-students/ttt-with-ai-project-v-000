class Board 
    attr_accessor :cells
    
    def initialize 
       reset!
    end
    
    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        index = input.to_i - 1 
        @cells[index]
        # !(@board[index].nil? || @board[index] == " ")
    end

    def full?
        @cells.all?{|x| x != " "}
    end

    def turn_count 
        @cells.count{|i| i == "X" || i == "O"}
    end 

    def taken?(input)
        position(input) == "X" || position(input) == "O" ? true : false
    end

    def valid_move?(input)
        input.to_i.between?(1,9) && !taken?(input) ? true : false      
    end

    def update(input, player) #player is player object. 
        index = input.to_i - 1
        cells[index] = player.token #player object calls "token" attribute
    end
end 