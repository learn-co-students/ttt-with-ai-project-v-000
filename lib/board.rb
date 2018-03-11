require 'pry'

class Board

    attr_accessor :cells

    def initialize
        @cells = Array.new(9, " ")
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
       puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
       puts "-----------"
       puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
       puts "-----------"
       puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        number = input.to_i
        pos = number - 1
        @cells[pos]
    end

    def full?
        !@cells.include?(" ")
    end

    def turn_count
        @cells.find_all{|char| char == "X" || char == "O"}.length
    end

    def taken?(input)
        number = input.to_i
        pos = number - 1
        @cells[pos] != " " ? true : false
    end

    def valid_move?(input)
        int = input.to_i
        int =< 9 && int >= 1 && taken(input) ? true : false


    end
end
