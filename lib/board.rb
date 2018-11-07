class Board

  attr_accessor :cells

  def initialize
    @cells = []
    set_board
  end

  def set_board
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    set_board
  end

  def display
    cells.each_with_index do |p,i|
      if i == 0 || i == 3
        puts " #{p} | #{cells[i + 1]} | #{cells[i + 2]} "
        puts " ------------ "
      elsif i == 6
        puts " #{p} | #{cells[i + 1]} | #{cells[i + 2]} "
      end
    end
  end

  def convert_to_index(p)
    p.to_i - 1
  end

  def position(p)
    cells[convert_to_index(p)]
  end

  def full?
    turn_count == 9
  end

  def turn_count
    cells.select {|p| p == "O" || p == "X"}.length
  end

  def taken?(p)
    position(p) == "X" || position(p) == "O"
  end

  def valid_move?(p)
    p.to_i.between?(1,9) && !taken?(p)
  end

  def update(p, player)
    cells[convert_to_index(p)] = player.token
  end

end
