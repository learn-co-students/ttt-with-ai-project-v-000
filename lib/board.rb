class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def int(pos)
    pos.to_i - 1
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def position(pos)
    #pos = pos.to_s - 1
    @cells[int(pos)]
  end

  def update(pos, player)
    @cells[int(pos)] = player.token       #player needs to be a player object
  end

   def full?
     @cells.all? {|pos| pos != " "}
   end

   def turn_count
     @cells.count {|pos| pos != " "}
   end

   def taken?(pos)
     @cells[int(pos)] != " " ? true : false
   end

   def valid_move?(pos)
     int(pos) >= 0 && int(pos) < 10 ? !taken?(pos) : false
   end

   def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
   end

 end
