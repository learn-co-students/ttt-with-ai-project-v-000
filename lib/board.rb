class Board
  attr_accessor :cells



  def initialize
    self.reset!

  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    b = @cells
    puts " #{b[0]} | #{b[1]} | #{b[2]} "
    puts "-----------"
    puts " #{b[3]} | #{b[4]} | #{b[5]} "
    puts "-----------"
    puts " #{b[6]} | #{b[7]} | #{b[8]} "
  end

  def position(pos)
    @cells[pos.to_i-1]
  end

  def full?
    @cells.all? do |pos|
      pos == "X" || pos == "O"
    end
  end

  def turn_count
    count = 0
    @cells.each do |pos|
      count +=1 if (pos != " ")
    end
    count
  end

  def taken?(pos)
    @cells[pos.to_i-1] != " "
  end

  def valid_move?(pos)
    if pos.match(/\A[1-9]\z/) == nil
      false
    else
      if self.taken?(pos)
        false
      else
        true
      end #if/else
    end #if/else
  end

  def update(pos, player)
    @cells[pos.to_i-1] = "#{player.token}" #puts X or O in cell
  end

end #class
