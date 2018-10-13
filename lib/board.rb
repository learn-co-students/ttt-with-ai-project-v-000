class Board 
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    @cells = []
    9.times do
      @cells << " "
    end
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?
    cells.all? { |cell| cell == "X" || cell == "O" }
  end

  def turn_count
    count = 0
    cells.each { |c| count += 1 if c == "X" || c == "O" }
    count
  end

  def taken?(input)
    position(input) != "" && position(input) != " "
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end
