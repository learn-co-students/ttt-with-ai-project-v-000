class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0..2].join(" | ")} "
    puts "-----------"
    puts " #{@cells[3..5].join(" | ")} "
    puts "-----------"
    puts " #{@cells[6..8].join(" | ")} "
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    @cells.count{|turn| turn == "X" || turn == "O"}
  end

  def taken?(index)
    @cells[index.to_i - 1] == "X" || @cells[index.to_i - 1] == "O" ? true : false
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end

end