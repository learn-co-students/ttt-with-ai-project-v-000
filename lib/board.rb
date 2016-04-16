class Board

  attr_accessor :cells
  attr_reader :token

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    cells.replace([" ", " ", " ", " ", " ", " ", " ", " ", " "])
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} " ## " #{pos[1]} | #{pos[2]} | #{pos[3]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} " ## " #{pos[4]} | #{pos[5]} | #{pos[6]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} " ## " #{pos[7]} | #{pos[8]} | #{pos[9]} "
  end

  def position(pos)
    self.cells[pos.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
     9 - self.cells.count {|c| c == " "}
  end

  def taken?(pos)
    !self.cells[pos.to_i - 1].include?(" ")
  end


  def valid_move?(pos)
    pos.to_i.between?(1,9) && !self.taken?(pos) ? true : false
  end

  def update(pos, player)
    if valid_move?(pos)
      position(pos).replace(player.token)
    end
  end

end
