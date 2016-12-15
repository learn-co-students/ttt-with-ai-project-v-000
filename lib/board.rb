class Board
  attr_accessor :cells, :turn_count

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
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
    return false if @cells.any? { |e| e == " " }
    true
  end

  def taken?(pos)
    self.position(pos) != " "
  end

  def turn_count
    turn_count = 0
    @cells.each { |e| turn_count += 1 if e != " " }
    turn_count
  end

  def valid_move?(move)
    if self.taken?(move) || !((1..9).include?(move.to_i))
      return false
    end
    true
  end

  def update(move, player)
    if valid_move?(move)
      index = move.to_i - 1
      @cells[index] = player.token
    else
      puts "Invalid move"
    end
  end
end
