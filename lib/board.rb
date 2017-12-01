class Board
  attr_accessor :cells
  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end #initialize
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end #reset!

  def display #done for now
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end #display

  def position(input)
    minput = input.to_i - 1
    @cells[minput]
  end #position

  def full?
    @cells.all? do |board_element| board_element == "X" || board_element == "O" end
  end #full

  def turn_count
    turns=0
      @cells.each do |board_space|
        if board_space == "O" || board_space == "X"
          turns +=1
        end
      end
      turns
  end #turn_count

  def taken?(index)
    mindex = index.to_i - 1 #mindex = method index, to retain index for any calls per help sesion with samnags
    if @cells[mindex] == "X" || @cells[mindex] == "O"
      true
    elsif @cells[mindex] == " " || @cells[mindex] == "" || @cells[mindex] == nil
      false
    end
  end #taken?

  def valid_move?(index)
    mindex = index.to_i - 1
    if mindex.between?(0, 8) && (taken?(index) == false)
        true
    elsif (mindex.between?(0,8) == false) || (taken?(index) == true)
        false
    end
  end #valid_move?

  def update(index, player)
    mindex = index.to_i - 1
    @cells[mindex] = player.token
  end #update

end #END OF BOARD CLASS
