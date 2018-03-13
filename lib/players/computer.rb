require 'pry'

module Players
  class Computer < Player

    def move(board)
      binding.pry
        valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        if !board.taken?("5")
         "5"
       elsif board.taken?("3") && board.taken?("5") == !self.token
          "7"
    # elsif board.taken?("5") && board.taken?("3")
    #      "7"
      #  elsif board.taken?("5") && board.taken?("7")
      #    "3"
      #  elsif board.taken?("5") && board.taken?("1")
      #    "9"

       else
         valid_moves.each {|move| board.valid_move?(move)}.sample
      end
    end




  end
end
