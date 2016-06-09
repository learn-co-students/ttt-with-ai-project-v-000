# puts "hello"
require 'pry'
class Board

    attr_accessor :board, :cells#, #:reset, :input

        @@cells = [" "," "," "," "," "," "," "," "," "]
        # @@cells =[]
        # @@board = [" "," "," "," "," "," "," "," "," "]

    def initialize
        # reset!
        # @cells = []
         @cells= [" "," "," "," "," "," "," "," "," "]
        # @board = [" "," "," "," "," "," "," "," "," "]
    end

    # def cells
    #     @cells #=[" "," "," "," "," "," "," "," "," "]
    # end
#binding.pry
    def display
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(pos)
        #board[input.to_i-1]
        cells[pos.to_i-1]

    end


    def full?
      cells.all? {|pos| pos != " "}
        # @cells.each do |cell|
    # binding.pry

            # return false if cell == " " || cell == "nil"
            # if cell == " " || cell == "nil"
            #     return true
            # elsif cell != " " and cell != "nil"
            #     return false
            # end
# cell != " " || cell != "nil"

# cell == " " || cell == "nil"
            # cell.exclude?(" ") || cells.exclude?("nil")
        # end
    end


    def turn_count
      cells.count {|i| i !=" "}
        # turns = 0
        # @cells.each do |cell|
        #     if cell != " " and cell != "nil"
        #         turns += 1
        #     end
        #
        # end
        # turns
    end

    def taken?(pos)
      num = pos.to_i-1
      cells[num] != " "
        # if @cells[pos.to_i-1] == "X" or @cells[pos.to_i-1] == "O"
        #   return true
        # elsif @cells[pos.to_i-1] == " " or @cells[pos.to_i-1] == "" or @cells[pos.to_i-1] == nil
        #   return false
        # return true if @cells[pos.to_i] == "X" || @cells[pos.to_i] == "O" || @cells[pos.to_i] != nil
      # end
    end

    def valid_move?(pos)
        @cells[pos.to_i-1] != "X" and @cells[pos.to_i-1] != "O" and @cells[pos.to_i-1] != nil and pos.to_i.between?(1, 9)
    end

    def update(pos, player)
      @cells[pos.to_i-1] = player.token if valid_move?(pos)       #   = current_player

    end


    def reset!()
        # @cells = Array.new(9, " ")
        @cells = [" "," "," "," "," "," "," "," "," "]
    end
end
