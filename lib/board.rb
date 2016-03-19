class Board

  attr_accessor :cells

  def initialize()
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def full?
    @cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  input = [input.to_i-1]

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def taken?(input)
    if (@cells[input.to_i-1] == "X" || @cells[input.to_i-1] == "O")
      return true
    else
      return false
    end
  end

  def update(input, user)
    @cells[input.to_i-1] = user.token
  end

end