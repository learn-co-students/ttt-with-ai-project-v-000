class Board
  attr_accessor :cells, :available_spaces

  def reset!
    @cells= [" "," "," "," "," "," "," "," "," "]
  end

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.none?{|i| (i != "X" && i != "O")}
  end

  def turn_count
    turns = 0
    @cells.each do |spot|
      if spot == "X" || spot == "O"
        turns += 1
      end
    end
    turns
  end

  def taken?(input)
    (position(input) == " " || position(input) == "" || position(input) == nil)? false : true
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    index = input.to_i - 1
    @cells[index] = player.token
  end

  def available_spaces
    available_spaces = []
      cells.each do |cell|
        if valid_move?(cell)
          available_spaces << cell
        end
        available_spaces
      end
  end
end
