require 'pry'
class Board
    attr_accessor :cells

    def initialize
        self.cells = Array.new(9, " ")
    end

    def reset!
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end  

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    # use this to make AI moves look like human input
    def index_to_input(index)
        (index + 1).to_s
    end
    
    # @param [String] e.g. "2", the user input
    # @retrun [Int] e.g. "X", located at index 1
    # TODO position is a bad name for this method
    # token_at_position would be better
    def position(user_input)
        self.cells[input_to_index(user_input)]
    end

    def full?
        !self.cells.include?(" ")
    end

    def turn_count
        self.cells.select {|cell| cell != " "}.length
    end

    def taken?(user_input)
        ["X", "O"].include?(position(user_input))
    end

    def valid_move?(user_input)
        !taken?(user_input) && input_to_index(user_input) >= 0 && 
        input_to_index(user_input) <= 8
    end

    def update(user_input, player)
        self.cells[input_to_index(user_input)] = player.token
    end
end