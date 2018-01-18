class Board

    attr_accessor :cells

    def initialize
      reset!
    end

    def reset!
      @cells = Array.new(9, " ")
    end

    def first_display
      puts " #{1} | #{2} | #{3} "
      puts "-----------"
      puts " #{4} | #{5} | #{6} "
      puts "-----------"
      puts " #{7} | #{8} | #{9} "
    end

    def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(board_choice)
      @cells[board_choice.to_i - 1]
    end

    def full?
      @cells.all? {|location| location == "X" || location == "O"}
    end

    def turn_count
      @cells.count {|cell| cell == "X" || cell == "O"}
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
