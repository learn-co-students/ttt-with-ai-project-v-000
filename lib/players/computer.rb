module Players
  class Computer < Player
   
  def move(board)
    #choices = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    #choices.sample.to_s
    #
      if board.cells[6] == " "
        "7"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[7] == " "
        "8"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[4] == " "
        "5"
      elsif board.cells[8] == " "
        "9"
      end
    
#some strategy but X/first comp will always win

    
    
    
    #puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    #puts "-----------"
    #puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    #puts "-----------"
    #puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  end 
end 