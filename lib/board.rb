class Board

  attr_accessor :cells

  def reset!
    @cells=[" "," "," "," "," "," "," "," "," "]
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def full?
    @cells.include?(" ") ? false : true
  end

  def turn_count
    counter=0
    @cells.each do |cell|
      if cell=="X"||cell=="O"
        counter+=1
      end
    end
    counter
  end

  def taken?(index)
    @cells[index.to_i - 1]=="X" || @cells[index.to_i - 1]=="O"
  end

  def valid_move?(input)
    index=input.to_i
    index>=1 && index<=9 && taken?(index) == false
  end

  def update(input, player)
    @cells[input.to_i-1] = "#{player.token}"
  end

end
