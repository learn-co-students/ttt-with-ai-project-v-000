class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = []
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display(cell = [])
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
   index = input.to_i
   index = index - 1
   @cells[index]
  end

  def full?
    if @cells.include?(" ")
      false
    elsif !@cells.empty?
      true
    end
  end

  def turn_count
    @cells.count("X") + @cells.count("O")
  end

  def taken?(spot)
    spot = spot.to_i - 1
    if @cells[spot].include?("X") || @cells[spot].include?("O")
      true
    elsif @cells[spot].include?(" ")
      false
    end
  end

  def valid_move?(input)
    index = input.to_i
    if index > 0 && index < 10
      index = index - 1
      if @cells[index].include?(" ")
        true
      end
    end
  end

  def update(input, player)
    index = input.to_i
    if index > 0 && index < 10
      index = index - 1
      @cells[index] = player.token
    end
  end

  def play
    
  end

end
