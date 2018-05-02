class Board
  attr_accessor :cells

  def reset!
    @cells = [' '] * 9
  end

  def initialize
    reset!
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
    user_index = input_to_index(user_input)
    @cells[user_index]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    turn_number = 0
    @cells.each do |space|
      if space == "X" || space == "O"
        turn_number += 1
      end
    end
    turn_number
  end

  def taken?(user_input)
    user_index = input_to_index(user_input)
    @cells[user_index] != " "
  end

  def valid_move?(user_input)
    user_index = input_to_index(user_input)
    user_index.between?(0,8) && !taken?(user_input)
  end

  def update(user_input, player = "X")
    if valid_move?(user_input)
      user_index = input_to_index(user_input)
      @cells[user_index] = "X"
    end
  end


end # class Board
