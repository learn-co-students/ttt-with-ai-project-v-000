class Board

  attr_accessor :cells

  def initialize
    @cells = [" "]*9
  end

  def reset!
    @cells = [" "]*9
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
     @cells[input.to_i-1]
   end

   def full?
      @cells.include?(" ") ? false : true
    end

   def turn_count
      @cells.count {|cell| cell == "X" || cell == "O"}
    end

    def taken?(input)
      @cells[input.to_i-1] == "X" || @cells[input.to_i-1] == "O" ? true : false
    end

    def valid_move?(input)
      if input.to_i.between?(1,9) && !full? && !taken?(input)
          true
        else
          false
        end
      end

    def update(input, player)
      @cells[input.to_i-1] = player.token
    end

end
