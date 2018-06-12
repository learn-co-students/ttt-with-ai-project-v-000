class Board
  attr_accessor :cells, :token

  @cells = []

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
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
    index = input.to_i - 1
    cells[index]
  end

  def full?
    cells.none? {|token| token == " "}
  end

  def turn_count
    counter = 0
    cells.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(index)
    if self.position(index) == " " || self.position(index) == "" || self.position(index) == nil
      false
    else self.position(index) == "X" || self.position(index) == "O"
      true
    end
  end

  def valid_move?(index)
    if index.length != 1
      false
    else
      index = index.to_i
      index.between?(0, 9) && !self.taken?(index)
    end
  end

  def update(index, current_player)
    index = index.to_i - 1
    cells[index] = current_player.token
  end

end
