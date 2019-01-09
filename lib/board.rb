class Board 
  
  attr_accessor :cells
  
  def initialize 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end 
  
  
  def reset! 
    @cells = [" ", " ", " ", " ", " ", " ", " ", " "," "]
  end
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def position(input)
    @cells[input.to_i-1]  
  end 
  
  def full?
    @cells.none? do |array|
      array == " " || array == ""
    end
  end 
  
  def turn_count 
    counter = 0 
    @cells.each do |current_player|
      if current_player == "X" || current_player == "O"
        counter += 1 
      end
    end
  counter
  end
  
  def taken?(index)
  !(@cells[index.to_i-1].nil? || @cells[index.to_i-1] == " ")
  end
  
  def valid_move?(index)
    index = index.to_i
    index.between?(1,9) && !taken?(index) 
  end
  
  def update(input, player) 
    @cells[input.to_i-1] = player.token
  end 
  
  
end 




