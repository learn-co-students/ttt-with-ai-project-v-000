class Board

attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def update(input,player)
    cells[input.to_i - 1] = player.token
  end

  def taken?(input)
    if position(input) == " "
      false
    elsif position(input) == "X" || position(input) == "O"
      true
    end
  end

  def full?
    check = true
    cells.each do |cell|
      if cell == " "
        check = false
      end
    end
    check
  end

  def turn_count
    count = 0
    cells.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end

  def valid_move?(input)
    taken?(input) == false && input.to_i.between?(1,9)
  end

end
