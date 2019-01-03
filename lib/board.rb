class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def full?
    @cells.all? {|x| x == "X" || x == "O"}
  end

  def turn_count
    @cells.count{|x| x == "O" || x == "X"}
  end

  def taken?(index)
    if position(index) == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    if index.to_i.between?(1,9)
      if taken?(index) == false
        true
      elsif taken?(index) == true
        false
      end
    else
      false
    end
  end

  def update(index, player)
    @cells[index.to_i-1] = player.token
  end
end
