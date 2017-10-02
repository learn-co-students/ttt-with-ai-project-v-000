class Board
  attr_accessor :cells

  def initialize
    @cells = []
    reset!
  end

  def cells
    @cells
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(user_input)
    index = input_to_index(user_input)
    @cells[index]
  end

  def full?
    @cells.all? { |position| position == "X" || position == "O" }
  end

  def turn_count
    counter = 0
    @cells.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(index)
    !(position(index).nil? || position(index) == " ")
  end

  def valid_move?(user_input)
    !taken?(user_input) && user_input.to_i.between?(1,9)
  end

  def update(user_input, player)
    index = input_to_index(user_input)
    @cells[index] = player.token
  end

end
