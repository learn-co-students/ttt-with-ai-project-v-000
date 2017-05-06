class Board

attr_accessor :cells

  #sets array w/ 9 slots & '' on each slot
  def initialize
      @cells =Array.new(9, " ")
  end

  #clears the @cells
  def reset!
    @cells =Array.new(9, " ")
  end

  #display the current cells state based on @board array
  def display
    puts  (" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} ")
    puts  ("-----------")
    puts  (" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} ")
    puts  ("-----------")
    puts  (" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} ")
  end

    #display the current cells status
  def position (position)
      position = position.to_i
      @cells[position-1]
  end
    # returns true for full board
  def full?
      !@cells.include?(" ")
  end

    #counts how many slots are occupied
  def turn_count
    @cells.reject{|obj| obj==" "}.size
  end

    #checks to see if a cell is occupied w/ X or O returns true||false
  def taken?(num)
    num = num.to_i
    @cells[num-1]=="X" || @cells[num-1]=="O"
  end

    #same as above to validate the move taken
  def valid_move?(num)
    num = num.to_i
    if num.between?(1,9)
       !taken?(num)
     else
    end
  end

    #if valid move it saves the move
  def update(cell, player)
      cell = cell.to_i
    if valid_move?(cell)
      @cells[cell-1]= player.token
      @cells[cell-1]
    end
  end

end
