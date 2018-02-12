class Board
  attr_accessor :cells, :player, :game

  def initialize
    self.reset!
  end

  def input_to_index(user_input)
    ((user_input.to_i) - 1)
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

  def position(number)
    cells[input_to_index(number)]
  end

  def full?
    if self.cells.include?(nil) || self.cells.include?(" ")
      return false
    else
      return true
    end
  end

  def turn_count
    counter = 0
    @cells.each do |position|
     if (position == "X" || position == "O")
       counter += 1
     end
    end
    counter
  end

  def taken?(number)
    index = input_to_index(number)
    if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
     return false
    else @cells[index] == "X" || @cells[index] == "O"
    return true
    end
  end

  def valid_move?(number)
    if number.to_i.between?(1,9)
      if self.taken?(number) == false
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def update(number, player)
    self.cells[input_to_index(number)] = player.token
  end



end
