class Board

  attr_accessor :cells
  @cells = []

  def initialize
    @cells = []
    # x = 0
    9.times do |x|
      @cells[x] = " "
     end

  end

  def cells
    @cells
  end

  def reset!
    9.times do |x|
      @cells[x] = " "
     end
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " ----------- "
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts " ----------- "
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

#coding wrong function START HERE!!!
  def position(move)
    index = move.to_i - 1
    turn = turn_count

    if turn % 2 == 0
      turn = " X "
    else turn = " O "
    end

    if @cells[index] == " "
      @cells[index] = turn
    end
    @cells
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell != " "
        counter += 1
      end
    end
    counter
  end

end
