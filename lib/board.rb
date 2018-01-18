class Board

  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
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

  def full?
    @cells.all? do |position|
      position != " "
    end
  end

  def turn_count
    counter = 0
    @cells.each do |player|
      if player == "X" || player == "O"
        counter +=1
      end
    end
    counter
  end

  def taken?(input)
    if @cells[input.to_i - 1] ==  " "
      false
    else
      true
    end
  end

  def valid_move?(input)
    !taken?(input) && input.to_i > 0 && input.to_i < 10
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token

  end


end
