class Board

  attr_accessor :cells

  def initialize(board = Array.new(9, " "))
    @cells = board
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    @cells.all? { |e| e == "O" || e == "X" }
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end

    counter
  end

  def taken?(input)
    @cells[input.to_i-1] == "X" || @cells[input.to_i-1] == "O"
  end

  def valid_move?(input)
    if input.to_i > 0 && input.to_i < 10
      if !taken?(input)
        return true
      end
    end
    false
  end

  def update(input, player)
    if valid_move?(input)
      @cells[input.to_i-1] = player.token
    end
  end

end
