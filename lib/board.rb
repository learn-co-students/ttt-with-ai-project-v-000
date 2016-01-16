class Board
  attr_accessor :cells, :token
  def initialize(amount=9,cell=" ")
    @cells = []
    @token = "X"
    amount.times do |i|
      @cells << cell
    end
  end

  def reset!
    @cells.clear
    9.times do |i|
      @cells << " "
    end
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    return @cells[input.to_i - 1]
  end

  def full?
    @cells.include?(" ") ? (return false) : (return true)
  end

  def turn_count
    count = 0
    @cells.each do |cell|
      count += 1 unless cell == " "
    end
    # @token = "O" if count % 2 == 0
    # bindind.pry
    return count
  end

  def taken?(input)
    if (position(input.to_i) == "X" || position(input.to_i) == "O")
      return true
    else 
      return false
    end
  end

  def valid_move?(input)
    if (input.to_i > 0 && input.to_i <= 9) && !taken?(input.to_i)
      return true
    else 
      return false
    end
  end

  def update(pos,player)
    @cells[pos.to_i - 1] = player.token
  end

end