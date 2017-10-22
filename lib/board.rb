class Board

  attr_accessor :cells
  attr_reader
  attr_writer
  def initialize
    @cells=[" "," "," "," "," "," "," "," "," "]
  end
  def reset!
    @cells=[" "," "," "," "," "," "," "," "," "]
  end

  def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
     index=input_to_index(input)
     @cells[index]
  end

  def full?
    @cells.none? { |e| e==" " }
  end

  def turn_count
    val_count=0
    @cells.each do |space|
          if ((space!="" && space!=" ")  )
            val_count+=1
          end
     end
     val_count
  end

  def taken?(input)
    index=input_to_index(input)
   if( (self.cells[index]=="")|| (self.cells[index]==" ")|| (self.cells[index]== nil))
        return false
     else
         return true
     end
  end

  def valid_move?(input)

   index=input_to_index(input)
    if (index<0 || index>8)
       return false
    else
     return !self.taken?(index+1)
   end
  end

  def update(input,player)
    index=input_to_index(input)
    @cells[index]=player.token
 end


  private
  def ask_for_input
    puts "Please enter 1-9:"
    input=gets.strip()
  end
  def input_to_index(user_input)
    input= user_input.to_i
    input=input -1
  end
end
