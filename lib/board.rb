require "pry"
class Board
    attr_accessor :cells

    def initialize
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        cells[input.to_i - 1]
    end

    def full?
        cells.all? { |e|  e == "X" || e == "O"}
    end

    def turn_count
        cells.count {|e| e == "X" || e == "O"}
    end

    def taken?(input)
        position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
        input.to_i.between?(1,9) && !taken?(input)
    end

    def update(input, player)
        # binding.pry
        cells[input.to_i - 1] = player.token
    end

    # def checkindex(token)
    #     # binding.pry
    #     cells.each_with_index.map{|i,e| e if i == token}.compact
    # end
end
