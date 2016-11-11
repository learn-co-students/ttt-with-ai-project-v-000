require 'pry'
class Board

    attr_accessor :cells

    def initialize
      @cells = Array.new(9, " ")
    end

    def reset!
      @cells.clear
      @cells = Array.new(9, " ")
    end

    def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(board_choice)
      choice = @cells[board_choice.to_i - 1]
      choice
    end

    def full?
      @cells.all? {|location| location == "X" || location == "O"}
    end

    def turn_count
      counter = 0
      @cells.each {|turn| counter += 1 if turn == "X" || turn == "O"}
      counter
    end

    def taken?(input)
      @cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
    end

    def valid_move?(input)
      input.to_i.between?(1,9) && !(taken?(input))
    end

    def update(position, player)
      self.cells[position.to_i - 1] = player.token
    end

end
