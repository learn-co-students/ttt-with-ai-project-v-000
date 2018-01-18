class Board
  attr_accessor :cells, :player, :token, :board

  def initialize
    @cells = new_board
  end

  def reset!
    @cells = new_board
  end

  def display
    board
  end

  def board
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i-1
  end

  def position(input)
    index = input_to_index(input)
    cells[index]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    cells.count {|i| i != " "}
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O" ? true : false
  end

  def valid_move?(input)
    if input.match(/\D/)
      then
      return false
    end
      !taken?(input)
    # index = input.to_i
    # !taken?(index) && index.between?(1, 9) ? true : false
  end

  def update(input, player)

    @cells[input_to_index(input)] = player.token
  end

  private
  def new_board
    Array.new(9, " ")
  end

end
