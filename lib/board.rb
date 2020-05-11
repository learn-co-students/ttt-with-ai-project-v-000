class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def first_display
    puts " #{1} | #{2} | #{3} "
    puts "-----------"
    puts " #{4} | #{5} | #{6} "
    puts "-----------"
    puts " #{7} | #{8} | #{9} "
    puts "-----------"
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    return "#{cells[input.to_i - 1]}"
  end

  def full?
    cells.all? {|cell| cell != " "}
  end

  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    if position(input) == "" || position(input) == " "
      false
    elsif position(input) == nil
      false
    elsif position(input) == "X" || position(input) == "O"
      true
    end
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
    display
  end

end
