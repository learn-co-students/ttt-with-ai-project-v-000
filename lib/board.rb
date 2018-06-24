require 'pry'
class Board
  attr_accessor :cells, :free_corner

  def initialize
    @cells = Array.new(9, " ")
  end


  # reader method for board cells
  def cells
    @cells
  end

  # resets the board cell for a new game?
  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end

  # method to display the game board. not the same as the cell array.
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  # convert input to idx
  def idx(input)
    @idx = input.to_i - 1
  end

  # position method already has #idx built in so dont need to call #idx again.
  def position(input)
    cells[self.idx(input)]
  end


  def full?
    cells.all?{|cell| cell != " "}
  end

  def turn_count
    cells.select{|cell| cell != " "}.count
  end

  def taken?(input)
    position(input) == " " ? false : true
  end

  def valid_move?(input)
    if (0..8).include?(self.idx(input)) && self.taken?(input) == false
      true
    else
      false
    end
  end

  def update(input, player)
    cells[idx(input)] = player.token
  end


  # def free_corner
  #   corner = []
  #   corner_cells = [1,3,7,9]
  #
  #   self.cells.each_with_index do |token, idx|
  #     if corner_cells.include?(idx)
  #       if !self.taken?(idx)
  #         corner << idx
  #       end
  #     else
  #       next
  #     end
  #     corner
  #   end
  #   @free_corner = corner
  # end
  #
  # binding.pry

end
