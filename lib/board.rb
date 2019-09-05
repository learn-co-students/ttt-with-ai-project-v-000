class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts ""
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts ""
    puts ""
    puts ""
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    counter = 0
    cells.each do
      |x| if x != " "
        counter += 1
        end
      end
    counter
  end

  def taken?(position)
    cells[(position.to_i - 1)] != " "? true : false
  end

  def valid_move?(input)
    (input.to_i).between?(1,9) && !self.taken?(input)? true : false
  end

  def update(position,player)
    index = position.to_i - 1
    cells[index] = player.token
  end
end
