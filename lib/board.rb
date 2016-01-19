class Board 
  attr_accessor :cells 

 def initialize 
   @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
   
 end
   
  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end 

  def display
    
    puts " #{cells[0]} | #{self.cells[1]} | #{@cells[2]} "
    puts "------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts '------------'
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num) 
    @cells[num.to_i-1]
  end 

  def full?
    !@cells.include?(" ")
  end

  
  def turn_count 
    @cells.count{|x|x=='X'||x=='O'}
  end 

  def taken?(num)
     if @cells[num.to_i-1] == "X" || @cells[num.to_i-1] == "O"
      true 
    else 
      false 
    end 
  end 
   
  def valid_move?(num)
     
     if num.to_i >=1 && @cells[num.to_i-1] == " "
      true 
    else 
      false 
    end

  end 

  
  def update(posit, player)
    @cells[posit.to_i-1] = player.token 
  end

end 