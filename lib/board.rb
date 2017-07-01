class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts "                                            "
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts "                                            "
  end

  def position(user_input)
      index = user_input.to_i - 1
      @cells[index]
  end

  def taken?(index)
    !(@cells[index.to_i-1].nil? || @cells[index.to_i-1] == " ")
  end

  def update(position, player)
      @cells[position.to_i - 1] = player.token
  end

  def token
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    @cells.all? do |square|
      if square == "X" || square == "O"
        true
      end
    end
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def valid_move?(input)
    index = input.to_i - 1
    index.between?(0,8) && !taken?(input)
  end

end
