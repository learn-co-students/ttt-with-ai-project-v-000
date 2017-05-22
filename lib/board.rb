class Board
    attr_accessor :cells
    def initialize
        @cells = Array.new(9, " ")
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
    def position(index)
        @cells[input_to_index(index)]
    end
    def full?
        !@cells.detect{|cell| (cell.nil? || cell == " " || cell == "")}
    end
    def turn_count
        @cells.select{|cell| !(cell.nil? || cell == " " || cell == "")}.count
    end
    def taken?(index)
        index = input_to_index(index)
        !(@cells[index].nil? || @cells[index] == " ")
    end
    def valid_move?(index)
        input_to_index(index).between?(0,8) && !taken?(index)
    end
    def update(index, player)
        fixed_index = input_to_index(index)
        !taken?(index) ? @cells[fixed_index] = player.token : nil
    end
    
    def available_indexes
        res = []
        @cells.each.with_index{|cell, index| res << index if empty_cell(cell)}
        res
    end
    def input_to_index(input)
        input.to_i - 1
    end
    def empty_cell(cell)
        cell.nil? || cell == " " || cell == ""
    end    
end
