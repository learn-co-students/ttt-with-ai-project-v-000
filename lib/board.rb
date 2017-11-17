class Board
  attr_accessor :cells



  def initialize
    @cells = [" "," "," "," "," "," "," "," "," ",]
  end

    def reset!
      cells.clear
      @cells = [" "," "," "," "," "," "," "," "," ",]
    end

  def display
    puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" +" #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" +" #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" +" #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    full = @cells.all? do |index|
      index == "X" || index == "O"
    end
    return full
  end

  def turn_count
    counter = 0
    @cells.each do |square|
      if square == "X" || square == "O"
        counter += 1
      end
    end
    return counter
  end

  def taken?(user_input)
    if @cells[user_input.to_i - 1] == "X" || @cells[user_input.to_i - 1] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(user_input)
    if user_input.to_i.between?(1,9) && !taken?(user_input)
      return true
    else
      return false
    end
  end

  def update(index, player)
    index = index.to_i - 1
    cells[index] = player.token
  end


end
