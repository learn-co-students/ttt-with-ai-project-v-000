class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
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
    @cells.all?{|position| position == "X" || position == "O"}
  end

  def turn_count
    spaces = 0
    @cells.each do |space|
      if space != " " && space != "" && space != nil
        spaces += 1
      end
    end
    return spaces
  end

  def taken?(location)
    position(location) == "X" || position(location) == "O"
  end

  #NOTE : Confirm that it should be 1-9 rather than 0-8 (though it looks like text defaults to 0)
  def valid_move?(index)
    #puts "index = #{index} #{index.to_i}|| #{!taken?(index)}"
    index.to_i.between?(1,9) && !taken?(index)
  end

  def update(index, player)
    #puts "player = #{player.token}"
    @cells[index.to_i-1] = player.token
  end

end
