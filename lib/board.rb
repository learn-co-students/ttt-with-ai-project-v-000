class Board
  attr_accessor :cells

  def initialize()
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    if @cells[input.to_i] == "O" || @cells[input.to_i] == " " || @cells[input.to_i] == "X"
     @cells[input.to_i-1]
   end
  end

  def full?
    @cells.any? {|space| space == " "} ? false : true
  end

  def taken?(input)
    if @cells[input.to_i - 1] == "X" || @cells[input.to_i - 1] == "O"
      true
    else
      false
    end
  end

  def turn_count
    count_turns = []
    @cells.select do |space|
      if space == "X" || space == "O"
        count_turns << space
      end
    end
    count_turns.size
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token
  end
end
