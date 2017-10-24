class Board
  attr_accessor :cells

  def initialize(cells = nil)
    reset!
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts
    puts
    puts
  end

  def position(move)
    move = input_to_index(move)
    @cells[move]
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def full?
    @cells.all? {|cell| cell != " "}
  end

  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(move)
    move = input_to_index(move)
    if @cells[move] == " " || @cells[move] == "" || @cells[move] == nil
      false
    else
      true
    end
  end

  def valid_move?(move)
    if taken?(move) || input_to_index(move) > 8 || input_to_index(move) < 0
      false
    else
      true
    end
  end

  def update(move, player)
    @cells[input_to_index(move)] = player.token
  end

end
