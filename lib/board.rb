class Board
  attr_accessor :cells

  def initialize
    reset!
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

  def position(position)
    user_input = position.to_i - 1
    @cells[user_input]
  end

  def full?
    @cells.all? {|i| i == "X" || i == "O"}
  end

  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(position)
    position1 = position.to_i - 1
    if cells[position1] == " " || cells[position1] == "" || cells[position1] == nil
      false
    else cells[position1] == "X" || cells[position1] == "O"
      true
    end
  end

  def valid_move?(position)#1-9 and not taken
    if position.to_i.between?(1, 9)
        if taken?(position) == false
          return true
        else taken?(position) == true
          return nil
        end
    else
      return false
    end
  end

  def update(position, object)
    position1 = position.to_i - 1
    cells[position1] = object.token
  end
end
