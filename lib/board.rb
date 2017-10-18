class Board
  attr_accessor :cells

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def initialize
    self.reset!
  end

  def display
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
   puts "-----------"
   puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
   puts "-----------"
   puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    index = user_input.to_i - 1
    @cells[index]
  end

  def full?
    @cells.none?{|cell| cell == " "} #remember difference bw = and ==
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
    if cell == "X" || cell == "O"
      counter += 1
    end
  end
  counter
end

  def taken?(index)
    position(index) == "X" ||  position(index) == "O"
  end

  def valid_move?(user_input)
    index = user_input.to_i - 1
    !taken?(user_input) && index.between?(0,8)
  end


  def update(user_input, player)
    index = user_input.to_i - 1
    @cells[index] = player.token
  end

end
