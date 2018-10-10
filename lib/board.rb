class Board

  attr_accessor :cells

  def initialize
   @cells = Array.new(9, " ")
  end

  def reset!
   @cells = Array.new(9, " ")
  end

  def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

    def position(user_input)
    cells[user_input.to_i-1]
   end

   def full?
    cells.all?  {|index| index == "X" || index == "O"}
   end

  def turn_count
  cells.count {|cell| cell == "X" || cell == "O"}
  end

   def taken?(num) #Returns false if the position is empty
     num = num.to_i - 1 if num.class == String
     !(cells[num].nil? || cells[num] == " ")
   end

   def valid_move?(input)
     input.to_i.between?(1,9) && !taken?(input)
   end

   def update(input, player)
    input = index(input)
    cells[input] = player.token
  end

  def index(input)
    input = input.to_i - 1
  end
  
  def full?
    cells.all?  {|index| index == "X" || index == "O"}
  end

 def turn_count
  cells.count {|cell| cell == "X" || cell == "O"}
 end

  def taken?(input)
   input = index(input)
   cells[input].include?("X") || cells[input].include?("O")
 end

end
