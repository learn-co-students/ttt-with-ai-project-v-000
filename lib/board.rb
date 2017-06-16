class Board
  attr_accessor :cells, :position, :turns

  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display #ex. cells = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
    puts " #{cells[0]} " + "|" + " #{cells[1]} " + "|" + " #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} " + "|" + " #{cells[4]} " + "|" + " #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} " + "|" + " #{cells[7]} " + "|" + " #{cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  def turn_count
    @turns = 0
    @cells.each do |cell|
      if cell == "X" || cell == "O"
        @turns += 1
      end
    end
    @turns
  end

  def taken?(input)
    index = input.to_i - 1
    if @cells[index] == " " || @cells[index] == "" || @cells[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(input)
    index = input.to_i - 1
    index.between?(0,8) && taken?(input) == false
  end

  def update(input, player)
    index = input.to_i - 1
    @cells[index] = player.token
  end

end
