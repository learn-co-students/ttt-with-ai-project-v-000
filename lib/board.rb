class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"                                                                            
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def user_input_to_index(user_input)
    user_input.to_i - 1
  end

  def position(user_input)
    board_position = user_input_to_index(user_input)
    @cells[board_position]
  end

  def full?
    @cells.all? {|board_position| %w[X O].include?(board_position)}
  end

  def turn_count
    counter = 0
    @cells.each do |count|
      if count == "X" || count == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(user_input)
    index = user_input_to_index(user_input)
    @cells[index] == "X" || @cells[index] == "O"
  end

  def valid_move?(user_input)
    index = user_input_to_index(user_input)
    !taken?(user_input) && index.between?(0,8)
  end

  def update(user_input, player)
    index = user_input_to_index(user_input)
    @cells[index] = player.token
  end
end
