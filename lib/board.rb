class Board
  attr_accessor :cells

  def initialize (cells = nil)
    @cells = cells || Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def position(index)
    true_index = input_to_index(index)
    @cells[true_index]
  end

  def update(index, player)
    true_index = input_to_index(index)
    @cells[true_index] = player.token
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def taken?(index)
    true_index = input_to_index(index)
    !(@cells[true_index] == " " || @cells[true_index] == "" || @cells[true_index] == nil)
  end

  def valid_move?(index)
    true_index = input_to_index(index)
    !taken?(index) && true_index >= 0 && true_index <= 8
  end

  def full?
    !(@cells.include?(" ") || @cells.include?(""))
  end

  def turn_count
    counter = 0
    @cells.each do |pos|
        if pos == "X" || pos == "O"
          counter += 1
        end
    end
    counter
  end
end
