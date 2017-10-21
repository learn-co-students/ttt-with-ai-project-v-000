class Board
  attr_accessor :cells, :token
  
  def initialize()
    reset!
  end  

  def reset!
    @cells = Array.new(9," ")
  end

  def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    @cells[pos.to_i-1]  
  end

  def update(pos, player)
    valid_move?(pos) ? @cells[pos.to_i-1] = player.token : nil
  end

  def full?
    @cells.all? {|cell| cell == "O" || cell == "X"}
  end

  def turn_count
    @cells.count {|cell| cell == "O" || cell == "X"}
  end

  def taken?(pos)
    position(pos) == "X" || position(pos) == "O" ? true : false 
  end

  def valid_move?(pos)
    if pos.to_i.between?(1,9)
      self.taken?(pos) ? false : true
    else
      false
    end
  end
end