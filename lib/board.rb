class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
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

  def position(str)
    @cells[str.to_i - 1]
  end

  def full?
    self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    counter =0
    self.cells.each do |position|
      if position == "O" || position == "X"
        counter +=1
      end
    end
    counter
  end

  def taken?(str)
    !(self.cells[str.to_i - 1].nil? || self.cells[str.to_i - 1] == " ")
  end

  def valid_move?(str)
    if taken?(str) == false && str.to_i.between?(1, 9)
      true
    end
  end

  def update(str, player_obj)
    if valid_move?(str) == true
      @cells[str.to_i - 1] = player_obj.token
    end
  end

end
