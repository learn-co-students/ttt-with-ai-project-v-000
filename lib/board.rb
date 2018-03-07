class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells.clear
    i = 0
    while i < 9
      @cells << " "
      i += 1
    end
  end

  def display
    puts "           "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "           "
  end

  def position(num)
    @cells[num.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    count = 0
    @cells.each do |x|
      if x == "O" || x == "X"
        count += 1
      end
    end
      count
  end

  def taken?(num)
    @cells[num.to_i - 1] == "X" || @cells[num.to_i - 1] == "O"? true : false
  end

  def valid_move?(num)
    !self.taken?(num) && num.to_i.between?(1,9)
  end

  def update(num, player)
    @cells[num.to_i - 1] = player.token
  end

end
