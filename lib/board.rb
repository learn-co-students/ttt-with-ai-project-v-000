class Board
  attr_accessor :cells, :player
   def initialize
    @cells = Array.new(9, " ")
  end
   def reset!
    @cells = Array.new(9, " ")
  end
  
  def reset_space(space)
    @cells[space.to_i - 1] = " "
  end

  def display
    output = ""
    0.upto(8) do |position| 
      output << " #{@cells[position]} "
      case position % 3 
      when 0, 1 then output << "|"
      when 2 then output << "\n-----------\n" unless position == 8
      end
    end
    puts output
  end
  def position(input)
    index = input.to_i - 1
    @cells[index]
  end
   def full?
    @cells.none? { |i| i == ' ' }
  end
   def turn_count
    counter = 0
    @cells.each do |turn|
      counter += 1 if turn == 'X' || turn == 'O'
    end
    counter
  end
   def taken?(input)
    index = input.to_i - 1
    if @cells[index] == '' || @cells[index] == ' ' || @cells[index].nil?
      false
    else
      true
    end
  end
   def valid_move?(input)
    input = input.to_i
    true if taken?(input) == false && input.between?(1, 9)
  end
  def all_available_spaces
    ("1".."9").to_a.select{|i| !taken?(i)}
  end

   def update(input, player)
    index = input.to_i - 1
    @cells[index] = player.token
  end
end