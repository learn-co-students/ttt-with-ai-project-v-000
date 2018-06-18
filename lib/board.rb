class Board
  attr_accessor :cells

  def initialize()
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    count = 0
    @cells.collect do |x|
      if x != " "
        count += 1
      end
    end
    count
  end

  # def turn_count
  #   cells.count{|token| token == "X" || token == "O"}
  # end

  def taken?(position)
    if @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token
  end


end
