class Board
  attr_accessor :cells

  def initialize()
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
  end

  def position(user_input)
    p = user_input.to_i - 1
    @cells[p]
  end

  def full?
    @cells.none?{|position| position == " "}
  end

  def turn_count
    counter = 0
    @cells.each do |position|
      if position != " "
        counter += 1
      end
    end
    return counter
  end

  def taken?(index)
    i = index.to_i-1
    !(@cells[i].nil? || @cells[i] == " ")
  end

  def valid_move?(index)
    i = index.to_i - 1
    i.between?(0,8) && !taken?(index)
  end

  def update(index, player)
    i = index.to_i - 1
    @cells[i] = player.token
  end
end
