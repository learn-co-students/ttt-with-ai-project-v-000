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

  def position(num)
    value = @cells[num.to_i-1]
  end

  def full?
    @cells.all? {|i| i == "X" || i == "O"}
  end

  def turn_count
    count = 0
    @cells.each do |i|
      if i == "X" || i == "O"
        count += 1
      end
    end
    count
  end

  def taken?(num)
    if @cells[num.to_i-1] == " "
      false
    else
      true
    end
  end

  def valid_move?(num)
    if num.to_i >= 1 && num.to_i <= 9 && self.taken?(num) == false
      true
    else
      false
    end
  end

  def update(pos, player_obj)
    if valid_move?(pos)
    @cells[pos.to_i-1] = player_obj.token
    end
    @cells
  end
=begin

=end

end
