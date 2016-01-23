class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def display
    puts (" "+cells[0]+" | "+cells[1]+" | "+cells[2]+" ")
    puts "-----------"
    puts (" "+cells[3]+" | "+cells[4]+" | "+cells[5]+" ")
    puts "-----------"
    puts (" "+cells[6]+" | "+cells[7]+" | "+cells[8]+" ")
  end

  def position(input)
    position = input.to_i - 1
    if (0..8).to_a.include?(position)
      return cells[position]
    end
  end

  def update(input, player)
    if valid_move?(input)
      cells[input.to_i-1] = player.token
    end
  end

  def full?
    !(cells.any? {|cell| cell == " "})
  end

  def turn_count
    count = 0
    cells.each do |cell|
      if cell != " "
        count += 1
      end
    end
    count
  end

  def taken?(position)
    if cells[position.to_i-1] == "X" || cells[position.to_i-1] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(input)
    if ("1".."9").to_a.include?(input) && !taken?(input)
      return true
    else
      return false
    end
  end



end
