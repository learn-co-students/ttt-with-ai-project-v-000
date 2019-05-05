class Board
  attr_accessor :cells, :turn_count, :WIN_COMBINATIONS
  def initialize
    @cells = cells
    reset!
  end

  def cells
    @cells
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
    @cells.none? do |space|
      if space == " "
        true
      else
        false
      end #ends if/else
    end #ends block code
  end #ends full? method

  def turn_count
    @cells.count {|c| c == "X" || c == "O"}
  end

  def taken?(move)
    @cells[move.to_i - 1] == "X" || @cells[move.to_i - 1] == "O"
  end

  def valid_move?(move)
    move_taken = move.to_i
    if move_taken.between?(1, 9) && taken?(move_taken) == false
     true
    else
      false
    end
  end

  def update(move, player)
    move_taken = move.to_i - 1
    @cells[move_taken] = player.token
    display
    puts "#{player.token} chose #{move}"
    puts ""
  end

end
