class Board
  attr_accessor :cells
  attr_reader :token
  @cells = []

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

  def position(u_i)
    @cells[u_i.to_i - 1]
  end

  def full?
    @cells.all? {|xo| xo != " "}
  end

  def turn_count
    @cells.count {|xo| xo != " "}
  end

  def taken?(p_num)
    @cells[p_num.to_i-1] != " "
  end

  def valid_move?(p_num)
    (p_num.to_i-1).between?(0,8) && !taken?(p_num)
  end

  def update(p_num, player)
    @cells[p_num.to_i-1] = player.token
    display
  end


end
