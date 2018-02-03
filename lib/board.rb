class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def update(user_position, player_object)
    @cells[user_position.to_i - 1] =  player_object.token
  end

  def display
    puts "  #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "------------"
    puts "  #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "------------"
    puts "  #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def full?
    @cells.all? do |index|
      index == "X" || index == "O"
    end
  end

  def turn_count
    counter = 0
    @cells.each do |cell|
      if cell != " "
        counter += 1
      end
    end
    counter
  end

  def taken?(individual_position)
    @cells[individual_position.to_i - 1] != " "
  end

  def valid_move?(individual_position)
    !taken?(individual_position) &&
    individual_position.to_i.between?(1, 9)
  end


  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

end
