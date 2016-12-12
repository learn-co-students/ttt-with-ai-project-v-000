class Board

attr_accessor:cells


  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts "\n #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
  end

  def reset!
    @cells = Array.new(9," ")
  end


 def position(input)
    @cells[input.to_i-1]
  end

  def full?
    @cells.all?{|element| element != " "}
  end

  def turn_count
    count = 0
    @cells.each do |element|
      count += 1 if element != " "
    end
    count
  end

 def taken?(input)
    position(input) != " "
  end


  def valid_move?(input)
    return false if input.to_i < 1 || input.to_i > 9
    taken?(input) == false
  end


  def update(input,player)
    @cells[input.to_i-1] = player.token
  end

  def undo(input)
    @cells[input-1] = " "
  end
end
