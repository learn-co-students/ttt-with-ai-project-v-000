require 'pry'
module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]]

    def near_win?(board)
      WIN_COMBINATIONS.each do |win_combination|
         win_index_1 = win_combination[0]
         win_index_2 = win_combination[1]
         win_index_3 = win_combination[2]

         position_1 = board.cells[win_index_1]
         position_2 = board.cells[win_index_2]
         position_3 = board.cells[win_index_3]

         t = self.token

      if position_1 == "#{t}" && position_2 == "#{t}" && position_3 == " "
        return   "#{win_index_3 + 1}"
      elsif position_1 == " " && position_2 == "#{t}" && position_3 == "#{t}"
          return "#{win_index_1 + 1}"
      elsif position_1 == "#{t}" && position_2 == " " && position_3 == "#{t}"
            return  "#{win_index_2 + 1}"
         end
       end
       return false
     end

     def block?(board)
       WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = board.cells[win_index_1]
          position_2 = board.cells[win_index_2]
          position_3 = board.cells[win_index_3]

          t = self.token

       if position_1 != "#{t}" && position_1 != " " && position_2 != "#{t}" && position_2 != " " && position_3 == " "
           return  "#{win_index_3 + 1}"
       elsif position_1 == " " && position_2 != "#{t}" && position_2 != " " && position_3 != "#{t}" && position_3 != " "
          return  "#{win_index_1 + 1 }"
       elsif position_1 != "#{t}" && position_1 != " " && position_2 == " " && position_3 != "#{t}" && position_3 != " "
            return   "#{win_index_2 + 1}"
          end
        end #end of the each loop
      return false #if the code reaches this line, we did not find a block to be made! return false
      end

  # def corners?(board)
  #   if board.cells[0] == " "
  #     "1"
  #   elsif board.cells[2] == " "
  #     "3"
  #   elsif board.cells[6] == " "
  #     "7"
  #   elsif board.cells[8] == " "
  #     "9"
  #    end
  #  return false #if no corner is available, return false
  # end

  def random_move
    return ["2", "4", "5", "6", "8"].sample
  end

  def corners?(board)
    ["1", "3", "7", "9"].find do |space|
      index = space.to_i - 1
      board.cells[index] == " "
     end
  end

   def move(board) #returns a string of the computer's desired move
     #binding.pry
    puts "Computer's move is:"
    if near_win?(board)
      puts "I've detected a win"
      return near_win?(board)
    elsif block?(board)
      puts "I'm blocking you!"
      return block?(board)
    elsif corners?(board)
      puts "Taking corner"
      return corners?(board)
    else
      return random_move
    end
   end

 end
end
