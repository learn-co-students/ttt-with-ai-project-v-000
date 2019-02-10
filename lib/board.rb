class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(location)
    @cells[location.to_i-1]
  end

  def update(location, current_player)
    @cells[location.to_i-1] = current_player.token
  end

  def full?
    @cells.all?{ |token| token == "X" || token == "O"}
  end

  def turn_count
    count = 0
    @cells.each do |c|
      if c != " "
        count += 1
      end
    end
    count
  end

  def taken?(location)
    @cells[location.to_i-1] != " " && @cells[location.to_i-1] != ""
  end

  def valid_move?(location)
    location.to_i.between?(1,9) && !taken?(location)
  end

end