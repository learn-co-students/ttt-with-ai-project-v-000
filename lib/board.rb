

class Board
  attr_accessor :cells
  ::WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

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

   def won?
       winning_combination = ::WIN_COMBINATIONS.find do |combination|
                               self.position(combination[0]+1) == self.position(combination[1]+1) and
                               self.position(combination[0]+1) == self.position(combination[2]+1) and
                               self.position(combination[0]+1) != " "
                              end

       winning_combination if winning_combination != nil
   end

   def winner
     self.cells[self.won?[0]] if self.won? != nil
   end
end
