class Board

  attr_accessor :cells
  attr_reader :board

  def initialize
    self.reset!
  end

  def board
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end


  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    self.board
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    if self.cells.all? {|cell| cell == "X" || cell == "O"}
      true
    end
  end

  def turn_count
    turns = []
    self.cells.each {|cell| turns << cell unless cell == " "}
    turns.size
  end

  def taken?(p)
    self.position(p) != " " ? true : false
  end

  def valid_move?(p)
    if p.to_i.between?(1,9) && !self.taken?(p)
      true
    else
      false
    end
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end


end
