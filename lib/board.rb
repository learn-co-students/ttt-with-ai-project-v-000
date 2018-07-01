require 'pry'
class Board
    attr_accessor :cells
    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
      ]

    def initialize
        self.reset!
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

    def position(cell_number)
        conversion = cell_number.to_i - 1
        self.cells[conversion] if (0..8).include?(conversion)
    end

    def full?
        !self.cells.include?(" ")
    end

    def turn_count
         self.cells.select{|i| i == "O" || i == "X"}.length
     end

     def taken?(cell_number)
        self.position(cell_number) == "X" || self.position(cell_number) == "O"
     end

     def valid_move?(cell_number)
         position(cell_number) && !taken?(cell_number)
     end

     def update(cell_number, player)
         self.cells[cell_number.to_i - 1] = player.token
     end

     def winning_move?
         winning_move = nil
         WIN_COMBINATIONS.each do |c|
            if self.cells[c[0]] == "X" && self.cells[c[1]] == "X" && self.cells[c[2]] == " "
                winning_move = c[2]
            elsif self.cells[c[0]] == "X" && self.cells[c[1]] == " " && self.cells[c[2]] == "X"
                winning_move = c[1]
            elsif self.cells[c[0]] == " " && self.cells[c[1]] == "X" && self.cells[c[2]] == "X"
                winning_move = c[0]
            end
         end
         winning_move
     end

end
