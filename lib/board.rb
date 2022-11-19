class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def display
    puts " #{@cells[0..2].join(' | ')} "
    puts "------------"
    puts " #{@cells[3..5].join(' | ')} "
    puts "------------"
    puts " #{@cells[6..8].join(' | ')} "
    puts "\n"
  end

  def first_display
    puts " 1 | 2 | 3 "
    puts "------------"
    puts " 4 | 5 | 6 "
    puts "------------"
    puts " 7 | 8 | 9 "
    puts "\n"
  end

  def full?
    cells.all? {|cell| cell != " "}
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def taken?(pos)
    self.position(pos) != " " ? true : false
  end

  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O" }
  end

  def update(pos, player)
    pos = pos.to_i - 1
    @cells[pos] = player.token
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

end
