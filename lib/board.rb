class Board

  attr_accessor :cells

  def initialize
    @cells =[" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells =[" "," "," "," "," "," "," "," "," "]
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def display
    i = 0
    puts "-----------"
    3.times do
      puts " #{@cells[i]} | #{@cells[i+1]} | #{@cells[i+2]} "
      i+=3
    end
  end

  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    count = 0
    i = 0
    while i<9
      if @cells[i]=="O" || @cells[i]=="X"
        count+=1
      end
      i+=1
    end
    count
  end

  def taken?(input)
    self.position(input) == "O" || self.position(input) == "X"
  end

  def valid_move?(input)
    if 1<= input.to_i && input.to_i <=9
      if !self.taken?(input)
        true
      else
        false
      end
    else
      false
    end
  end

  def update(input, player)
    @cells[input.to_i-1] = player.token
  end
end
