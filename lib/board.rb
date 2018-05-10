

class Board
  attr_accessor :cells, :game

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts  " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts  "-----------"
    puts  " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts  "-----------"
    puts  " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos_num)
    value_in_cell = @cells[pos_num.to_i-1] if pos_num.to_i != 0
  end

  def full?
    @cells.all? {|position| position == "X" or position == "O"}
  end

  def turn_count
    @cells.count {|position| position == "X" or position == "O"}
  end

  def taken?(pos_num)
    if self.position(pos_num) == "X" or self.position(pos_num) == "O" and pos_num.to_i != 0
      true
    else
      false
    end
  end

  def valid_move?(pos_num)
    if self.taken?(pos_num) == false and pos_num.to_i.between?(1,9) == true
      true
    else
      false
    end
  end

  def update(pos_num, player)
    if self.valid_move?(pos_num)
      if player.class == String
        @cells[pos_num.to_i-1] = player
      else
        @cells[pos_num.to_i-1] = player.token
      end
      @pos_num =  pos_num.to_i
    end
  end


#  def space_available?(pos_num)
     #if self.cells[pos_num.to_i-1] == " "
      # true

     #else
    #   false
    # end
   #end

   def available_spaces
     available = []
     i = 1
     self.cells.each do |cell|
       if cell == " "
         available << i
       end
       i+=1
     end
     available
   end




end
