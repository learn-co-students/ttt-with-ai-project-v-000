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
    puts
    puts
  end

  def position(move)
    @cells[move.to_i - 1]
  end

  def full?
    @cells.include?(" ")? false : true
  end

  def taken?(check)
    @cells[check.to_i - 1] == " "? false : true
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

  def valid_move?(move)
    move = move.to_i
    if move > 0 && move < 10
      if @cells[move - 1] == " "
        true
      end
    else
      false
    end
  end

  def update(move, player)
    move = move.to_i
    token = player.token
    @cells[move - 1] = token
  end
end
