class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    choice = user_input.to_i - 1
    @cells[choice]
  end

  def move(index, player)
    @cells[index] = player
  end

  def full?
    if @cells.any?{|a| a == " " || a == ""}
     false
    else true
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

  def taken?(input)
    index = input.to_i - 1
    @cells[index] != " " && @cells[index] != ""
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    #binding.pry
    @cells[index.to_i - 1] = player.token
  end

end
