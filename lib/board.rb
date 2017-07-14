class Board


  def initialize(cells=nil)
    @cells = cells || Array.new(9, " ")
  end

  def cells=(cells)
    @cells = cells
  end

  def cells
    @cells
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

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    if @cells.any? do |i|
      i == " " || i == nil
      end
      return false
    else
      return true
    end
  end

  def turn_count
    counter = 0
    @cells.each do |turns|
      if turns == "X" || turns == "O"
      counter += 1
      end
    end
    return counter
  end

  def taken?(index)
    index = index.to_i-1
    if  @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
     @cells[index] = !true
   else
     @cells[index] = true
   end
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    @cells[index.to_i-1] = player.token
  end




end
