class Board

  attr_accessor :cells

  @cells = []

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    value = true
    @cells.each do |cell|
      if cell == " "
        value = false
      end
    end
    value
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(input)
    index = input.to_i - 1
    value = true
    if (@cells[index] == " " || @cells[index] == "" || @cells[index] == nil)
      value = false
    end
    value
  end

  def valid_move?(input)
    value = false
    index = input.to_i
    if index.between?(1,9) && !taken?(index)
    value = true
    end
    value
  end

  def update(input, player)
    index = input.to_i - 1
    if valid_move?(input)
      @cells[index] = player.token
    end
  end

end
