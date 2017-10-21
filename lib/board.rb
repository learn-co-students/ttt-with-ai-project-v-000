class Board
  attr_accessor :cells, :turn_count

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    taken_cells = 0
    @cells.each.with_index do |cl, idx|
      if taken?(idx)
        taken_cells +=1
      end
    end
    if taken_cells < 9
      false
    else
      true
    end
  end

  def taken?(input)
    if (@cells[input.to_i-1] == "X") || (@cells[input.to_i-1] == "O")
      true
    else
      false
    end
  end

  def turn_count
    taken_cells = 0
    @cells.each.with_index do |cl, idx|
      if taken?(idx)
        taken_cells +=1
      end
    end
    taken_cells
  end

  def valid_move?(num)
    if (taken?(num) == false) && ((1..9).include?(num.to_i) == true)
      true
    else
      false
    end
  end

  def update(num, player)
    @cells[num.to_i-1] = player.token
  end

end