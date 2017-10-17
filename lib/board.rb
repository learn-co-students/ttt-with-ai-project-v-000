require 'pry'

class Board

    attr_accessor :cells

    def initialize
        @cells = Array.new(9, " ")

    end

    def reset!
        9.times { |i| self.cells[i] = " "}
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(user_input)
        cells[user_input.to_i - 1]
    end

    def full?
        !self.cells.include?(" ")
    end

    def turn_count
        cells.count("X") + cells.count("O")
    end

    def taken?(user_input)
        self.position(user_input) == "X" || self.position(user_input) == "O"
    end

    def valid_move?(user_input)
        (1..9).include?(user_input.to_i) && !self.taken?(user_input)
   #     binding.pry
    end

    def update(user_input, player)
        @cells[user_input.to_i - 1] = "#{player.token}"
    end
end

