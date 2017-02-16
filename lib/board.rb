class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} " + "|" + " #{@cells[1]} " + "|" + " #{@cells[2]} "
    puts "-"* 11
    puts " #{@cells[3]} " + "|" + " #{@cells[4]} " + "|" + " #{@cells[5]} "
    puts "-"* 11
    puts " #{@cells[6]} " + "|" + " #{@cells[7]} " + "|" + " #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    if @cells.include?(" ")
      false
    else @cells.include?("X" || "O")
      true
    end
  end

  def turn_count
    count = 0
    @cells.each { |cell| count += 1 unless cell == " " }
    count
  end

  def taken?(position)
    cells[position.to_i - 1] == " " ? false : true
  end

  def valid_move?(position)
    !taken?(position) && position.to_i.between?(1, 9) ? true : false
  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
end