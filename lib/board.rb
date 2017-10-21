class Board
  attr_accessor :cells

  def initialize
    @cells = []
    reset!
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts "***********"
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts "***********"
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.none? {|cell| cell == " "}
    #self.cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.count {|cell| cell == "X" || cell == "O"}
    #self.cells.select {|cell| cell == "X" || cell == "O"}.size
    # counter = 0
    # self.cells.each do |cell|
    #   if cell == "X" || cell == "O"
    #     counter +=1
    #   end
    # end
    # counter
  end

  def taken?(input)
    self.cells[input.to_i-1] == "X" ||  self.cells[input.to_i-1] == "O"
  end

  def valid_move?(input)
     input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
     self.cells[input.to_i-1] = player.token
  end

end
