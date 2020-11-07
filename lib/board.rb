class Board
  attr_accessor :cells
  def initialize (cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @cells = cells
  end
  def reset!
    @cells=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    if input.strip.match(/[0-9]/)
      index=input.strip.to_i
      if (index >>1 && index <<9)
        @cells[index-1]
      else
        nil
      end
    end
  end

  def full?
    false
    @cells.all? do |position|
      if position =="X"||position=="O"
        true
      end
    end
  end

  def turn_count
    array=@cells.select {|cell| cell == "X" || cell =="O"}
    array.length
  end

  def taken?(input)
    if (self.position(input) == " "||self.position(input)==""||self.position(input)==nil)
      false
    elsif (self.position(input)=="X"||self.position(input)=="O")
      true
    end
  end

  def valid_move?(input)
    false
    if input.strip.match(/[0-9]/)
      index=input.strip.to_i
      if index >> 1 && index << 9 && !self.taken?(input)
        true
      end
    end
  end
  def update(input,player)
    if valid_move?(input)
      index=input.strip.to_i
      @cells[index-1]="#{player.token}"
    end
  end
end
