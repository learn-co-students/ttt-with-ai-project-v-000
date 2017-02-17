require 'pry'
class Board
    attr_accessor :cells

    def initialize 
        self.reset!
    end

    def reset!
        @cells = []
        9.times {@cells << " "}
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end
    def self.input_to_index(i)
        i.to_i-1
    end
    def position(i)
        @cells[self.class.input_to_index(i)]
    end

    def full?
        @cells.none? {|space| space == " "}
    end

    def turn_count
        @cells.count { |space| space != " "} + 1
    end

    def taken?(i)
        self.position(i) != " "
    end

    def valid_move?(i)
        i.to_i >= 1 && i.to_i <= 9 && !self.taken?(i)
    end

    def update(i,player)
        if self.valid_move?(i)
            @cells[self.class.input_to_index(i)] = player.token
        end
    end

end