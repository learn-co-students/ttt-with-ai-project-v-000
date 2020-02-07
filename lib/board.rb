class Board
attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def display

    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "\n"
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(pos)
    pos = pos.to_i
    @cells[pos-1]
  end

  def full?
    @cells.all?{|cell| cell == 'X' || cell == 'O'}
  end

  def turn_count
    count = 0
    @cells.each{|cell| count+=1 if cell == 'X' || cell == 'O'}
    count
  end

  def taken?(pos)
    pos = pos.to_i
    if @cells[pos-1] == 'X' || @cells[pos-1] == 'O'
      return true
    else
      return false
    end
  end

  def valid_move?(pos)
    if !taken?(pos) && pos.to_i < 10 && pos.to_i > 0
      return true
    else
      return false
    end
  end

  def update(pos, player)
    if valid_move?(pos)
      @cells[pos.to_i - 1] = player.token
    end
  end
end
