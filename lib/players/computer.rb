require 'pry'

module Players
  class Computer < Player
    def move(board)
      computer_input = nil
      #original basic code where computer picks randomly. if the input is invalid (position already occupied),
      #then it runs #move again to pick a diff number at random
    #  computer_input = rand(1..9).to_s
    #  if !board.valid_move?(computer_input)
    #    move(board)
    #  else
    #    computer_input
    #  end
    #end
    #code for AI:
      if !board.taken?("5") #take center spot if available
        computer_input = "5"
      elsif board.turn_count == 1 #when computer is "O", take a corner
        corners = ["1", "3", "7", "9"]
        corners.sample
      elsif board.turn_count == 2 #when computer is "X," take an available corner
        computer_input = ["1", "3", "5", "7"].find do |corner| !board.taken?(corner)
        end
      elsif board.turn_count >= 3
        computer_input = rand(1..9)
        if !board.valid_move?(computer_input)
          move(board)
        else
          computer_input
        end
      end
    end



      #computer_input = rand(1..9).to_s
    #end
    #  if board.turn_count == 2 || board.turn_count == 4 #&& !board.taken?("3")
    #    corner(board)
    #  end
      #if board.turn_count == 4
      #  computer_input = "3" if board.valid_move?("3")
      #elsif board.turn_count == 2 && !board.taken?("7")
      #  computer_input = "7" if board.valid_move?("7")
      #elsif board.turn_count == 2 && board.taken?("9")
      #  computer_input = "9" if board.valid_move?("9")
      #if board.turn_count == 4 && board.taken?("1") && board.taken?("3")
      #  computer_input = "2" unless !board.valid_move?("2")
      #elsif board.turn_count == 4 && board.taken?("1") && board.taken?("7")
      #  computer_input = "4"unless !board.valid_move?("4")
      #else
    #end

#  def center(board) #takes the middle spot
#    computer_input = "5"
#  end

  #def corner(board) #chooses a random corner. if computer is player 1, it should always go into a corner
    #for greatest chance of winning
  #  corners = ["1", "3", "7", "9"]
  #  corners.sample
  #end
#    if board.valid_move?(corners.sample)
#      computer_input = corners.sample
#    end
#  end

#  def random(board) #random spot
#    computer_input = rand(1..9).to_s
#  end

  end
end



#def corner(board)
#  corners = ["1", "3", "7", "9"]
#  corners.select do |position|
#    computer_input = !board.taken?(position).sample
    #computer_input = position
#  end
#end
