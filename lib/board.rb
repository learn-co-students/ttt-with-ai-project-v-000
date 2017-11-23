class Board
  attr_accessor :cells



    def initialize(board = nil)
      @cells = board || Array.new(9, " ")
    end



  def reset!
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

  def position(i)
    @cells[i.to_i-1]
  end

  def full?
    turn_count==9
  end

  def turn_count
    @cells.count {|cell|   cell=="X" || cell=="O"}
  end

  def taken?(index)
    @cells[index.to_i-1] != " " && @cells[index.to_i-1] != ""
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, player)
      @cells[index.to_i-1] = player.token if valid_move?(index)
  end

end
