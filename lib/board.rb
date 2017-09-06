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

  def position(input)
    @cells[input.to_i - 1]
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

  def taken?(input)
    self.position(input) != " "
  end

  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && !self.taken?(input)
  end

  def full?
    #@cells.none? {|cell| cell == " "}
    #@cells.all? {|cell| cell != " "}
    (1..9).to_a.all? {|i| self.taken?(i)}
  end

  def turn_count
    count = 0
    #@cells.each do |cell|
    #  if cell != " "
    #    count += 1
    #  end
    #end
    (1..9).to_a.each do |i|
      if self.taken?(i)
        count += 1
      end
    end
    count
  end

end
