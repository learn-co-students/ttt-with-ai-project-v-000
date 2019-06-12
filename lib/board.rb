require 'pry'

class Board

  attr_accessor :cells

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
    cell_index = cell_number.to_i - 1

    position = @cells.detect.with_index do |cell,index|
      cell_index == index
    end

    position
  end

  def full?
    if @cells.any? { |cell| cell == " " }
      return false
    elsif @cells.all? { |cell| cell == "X" || cell == "O" }
      return true
    end
  end

  def turn_count
    @cells.count("X") + @cells.count("O")
  end

  def taken?(cell_number)
    if position(cell_number) == "X" || position(cell_number) == "O"
      true
    elsif position(cell_number) == " "
      false
    end
  end

  def valid_move?(cell_number)
    if cell_number.to_i.between?(1,9)
      unless taken?(cell_number)
        true
      end
    end
  end

  def update(cell_number, player)
    if valid_move?(cell_number)
      @cells[cell_number.to_i - 1] = player.token
    end
    @cells
  end

end
