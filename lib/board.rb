class Board
  attr_accessor :cells, :token

  @cells = []

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset! #reset the state of the cells to what a board should look like at the start of a game
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def display #prints the current state of the board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    input = input.to_i - 1
    cells[input]
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

  def valid_move?(index) # need to handle "invalid" input as index
    if index.length != 1
      false
    else
      index = index.to_i
      index.between?(0, 8) && !self.taken?(index)
    end
  end

  def update(input, token)
    input = input.to_i - 1
    cells[input] = token.token
  end

end
