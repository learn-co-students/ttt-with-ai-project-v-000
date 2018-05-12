class Board
  attr_accessor :cells


  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def full?
    @cells.all? do |position|
      position == "X" || position == "O"
    end
  end

  def turn_count
    @cells.count("X") + @cells.count("O")
  end

  def taken?(index)
    @cells[index.to_i - 1] == "X" || @cells[index.to_i - 1] == "O"
  end

  def valid_move?(index)
    index_new = index.to_i - 1
    index_new.between?(0,8) && !taken?(index)
  end

  def update(index, player_no)
    @cells[index.to_i - 1] = player_no.token
  end

end

#learn spec/01_board_spec.rb
