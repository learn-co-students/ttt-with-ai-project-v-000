class Board
  attr_accessor :cells

  def initialize(cells=Array.new(9, " "))
    @cells = cells
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

  def position(user_input)
    cells[user_input.to_i-1]
  end

  def full?
    !cells.any? { |x| x == " " }
  end

  def turn_count
    counter = 0
    cells.each do |el|
      if el == "X"
        counter += 1
      elsif el == "O"
        counter += 1
      end
    end
    return counter
  end

  def taken?(user_input)
    cells[user_input.to_i - 1] != " " && cells[user_input.to_i - 1] != ""
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !taken?(user_input.to_i)
  end

  def update(position, player)
    if self.valid_move?(position)
      cells[position.to_i - 1] = player.token
    elsif !self.valid_move?(position)
      puts "invalid"       #commented code below works perfectly but fails a test 04spec:189
      player.move(self)    #with active codere-entered move after invalid (even if invalid) doesn't seem to
    end                    #do anything
  end
end

#else !self.valid_move?(position)
#  puts "invalid"
