class Board
  attr_accessor :cells

  def initialize
    reset!
    #binding.pry
  end

  def reset!
    @cells = Array.new(9, " ") #[" ", " ", " ", " ", " ", " ", " ", " ", " "]
    #binding.pry
  end

  def display
    counter = 0
    @cells.each do |space|
      counter += 1
      if counter == 3 || counter == 6 || counter == 9
        print " #{space} "
      else
        print " #{space} |"
      end
      if counter % 3 == 0
        if counter == 9
          break
        else
          print "\n"
          puts "-----------"
        end
      end
    end
  end

  def position(input)
    input = input.to_i - 1
    #binding.pry
    return "#{@cells[input]}"
  end

  def full?
    @cells.detect {|space| space == " "} ? false : true
  end

  def turn_count
    turn_count = Array.new
    turn_count = @cells.find_all {|space| space == "X" || space == "O"}
    return turn_count.size
  end

  def taken?(position)
    @cells[(position.to_i - 1)] == " " ? false : true
  end

  def valid_move?(input)
    #binding.pry
    if input.to_i > 0 && input.to_i <= 9
      !taken?(input)
    else
      false
    end
  end

  def update(input, player)
    if valid_move?(input)
      #binding.pry
      @cells[(input.to_i - 1)] = player.token
    end
  end

end
