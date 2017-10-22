class Board
  attr_accessor :cells

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def full?
    @cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count{|player| player == "X" || player == "O"}
  end

  def taken?(index)
   @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    !taken?(index) && index.to_i.between?(1, 9)
  end

  def taken?(index)
    !(position(index) == " " || position(index) == "")
  end

  def position(input)
    @cells[input.to_i-1]
  end

    def move(index, player)
      @board[index] = player
    end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end
