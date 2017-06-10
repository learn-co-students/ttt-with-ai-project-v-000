class Board
  attr_accessor :cells, :game

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

  def position(index)
    @cells[index.to_i - 1]
  end

  def update(index, player)
     @cells[index.to_i - 1] = player.token
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def taken?(index)
    !(position(index) == " " || position(index) == "" || position(index) == nil)
  end

  def valid_move?(index)
    !taken?(index.to_i) && index.to_i >= 1 && index.to_i <= 9
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
