class Board
  attr_accessor :cells

  def initialize(cells = nil)
    @cells = cells || Array.new(9, " ")
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
    self.cells[input.to_i - 1]
  end

  def full?
    @cells.each do |position|
      if position == " "
         return false
       end
     end
   return true
  end

  def turn_count
    @cells.count{|cell| cell != " "}
  end

  def taken?(index)
    !(@cells[index].nil? || @cells[index] == " ")
  end

  def valid_move?(input)
    index = input.to_i - 1
    if taken?(index) == false && index.between?(0, 8)
      return true
    else
      puts "This is not a valid move!"
      return false
    end
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
    @cells
  end

  def full?
    @cells.all? {|position| position != " "}
  end

end
