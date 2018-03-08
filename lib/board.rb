class Board 
  
  attr_accessor :cells 
  
  def initialize
    reset!
  end
  
  def cells 
    @cells 
  end 
  
  def reset!
    self.cells=(Array.new(9, " "))
  end 
    
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def position(position)
    index = input_to_index(position)
    cells[index]
  end

  def full?
    @cells.include?("X" || "O")
    !@cells.include?(" ")
  end
  
  def turn_count
    counter = 0
      @cells.each do |position|
        if position != " "
          counter += 1
        end
      end
    counter
  end
  
  def taken?(num)
    num = num.to_i - 1 if num.class == String
    !(@cells[num].nil? || @cells[num] == " ")
  end

  def valid_move?(position)
    new_position = input_to_index(position)
    new_position.between?(0,8) && !taken?(new_position)
  end
  
  def update(position, player)
    index = input_to_index(position)
    cells[index] = player.token
  end


end 