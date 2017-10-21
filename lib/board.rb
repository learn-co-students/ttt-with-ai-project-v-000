class Board

  attr_accessor :cells, :index, :player

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display  
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(index)
    cells[index.to_i-1]
  end

  def full?
    if cells.detect{|i| i == " "} 
      return false
    else !cells.detect{|i| i == " "}
      return true
    end
  end

  def turn_count
    count = 0
     cells.each do |position|
      if "#{position}" == "X" || "#{position}" == "O"
        count += 1
     end
    end
   count 
  end 

  def taken?(index)
    cells[index.to_i-1] != " "
  end

  def valid_move?(index)
    input = index.to_i-1
    if !taken?(index) && input.between?(0,8)
      true
    else 
      false
    end
  end

  def update(index, player)
    cells[index.to_i-1] = player.token
  end
end