class Board
  attr_accessor :cells
  def reset! 
    self.cells=Array.new(9,' ')
  end 
  def initialize
    @cells=Array.new(9,' ')
  end 
  def display 
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end
  def position(n) #returns x or o based on user input and board
    self.cells[n.to_i-1]
  end 
  
  def full?
    [0,1,2,3,4,5,6,7,8].all?{|x| self.cells[x]=='X' or self.cells[x]=='O'}
  end
  
  def turn_count
    count=0
    self.cells.each do |spot|
      count+=1 if spot=='X' or spot=='O'
    end
    return count
  end
  
  def taken?(x)
    self.position(x)=='X' or self.position(x)=='O'
  end
  
  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index) 
  end
  
  def update(n,player)
    self.cells[n.to_i-1]=player.token
  end
end



  