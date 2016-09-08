class Board
  attr_accessor :cells



  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts  "-----------"
    puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts  "-----------"
    puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(location)
    ## Subtracted one from input to get index value of array
    ## implment location.to_i - 1 somewhere else to get DRY
    @cells[location.to_i - 1]
  end

  def full?
    !(@cells.include?(" " || nil))
  end

  def turn_count
      count = 9
      @cells.each do |x|
        if x == " " || x == nil
          count -= 1
        end
      end
      count
  end

  def taken?(location)
    ## Subtracted one from input to get index value of array
    ## implment location.to_i - 1 somewhere else to get DRY
    !(@cells[location.to_i - 1] == " ")
  end

  def valid_move?(location)
    !taken?(location) && location.to_i.between?(1,9)
  end

  def update(location, player)
    ## Subtracted one from input to get index value of array
    ## implment location.to_i - 1 somewhere else to get DRY
    @cells[location.to_i - 1] = player.token

  end

end
