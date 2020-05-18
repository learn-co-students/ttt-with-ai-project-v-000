class Board
    attr_accessor :cells

    def initialize()
        reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "     
    end

    def position(user_input)
        cells[user_input.to_i - 1]
    end

    def update(move_to, player)
        cells[move_to.to_i - 1] = player.token
    end

    def full?
        cells.all?{ |token| token == "X" || token == "O" }
    end

    def turn_count
        cells.count{|token| token == "X" || token == "O" }
    end

    def taken?(space)
        !(position(space) == " " || position(space) == "")
    end

    def valid_move?(move)
        move.to_i.between?(1,9) && !taken?(move)
    end
end