class Board
attr_accessor :cells

  def initialize
    reset!
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
    puts "-----------"
  end

  def position(index)
    @cells[index.to_i-1]
  end

  def full?
    @cells.all?{|ch| ch == "X" || ch =="O"}
  end

  def turn_count
    cnt = 0
    @cells.each {|ch|
      if ch == "X" || ch == "O"
        cnt += 1
      end
    }
    cnt
  end

  def taken?(index)
    if @cells[index.to_i - 1] == "X" || @cells[index.to_i - 1] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
      input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i - 1]  = player.token
  end


end
