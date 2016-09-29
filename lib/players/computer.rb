module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2], #Top Row
      [3,4,5], #Middle Row
      [6,7,8], #Bottom Row
      [0,3,6], #Left Column
      [1,4,7], #Middle Column
      [2,5,8], #Right Column
      [0,4,8], #Diagonal from top right
      [6,4,2]  #Diagonal from top left
      ]

    def call
      puts
      puts "#{token}'s move:"
    end

    def move(board)
      call
      first_move(board)
      # puts
      # puts "#{token}'s move:"
      # if !board.taken?("5")
      #   "5"
      # elsif board.taken?("5")
      #   (1..9).to_a.reject{|i| i == 5}.sample.to_s


      # elsif complete_combo(board) != nil
      #   cell = complete_combo(board)
      #   cell
      # end



    end

    def first_move(board)
      board.valid_move?("5") ? "5" : (1..9).to_a.reject{|i| i == 5}.sample.to_s
    end


    # def player_2_move_1(board)
    #
    # end
    #
    # def opp_corners(board)
    #
    # end

    def complete_combo(board)
      WIN_COMBINATIONS.detect do |combo|
        combo.detect do |cell| #need to iterate over combos and return a cell?

          board.position(cell) != self.token && board.position(cell) == " "
        # if (board.position(combo[0] + 1) == self.token && board.position(combo[1] + 1) == self.token) && (board.position(combo[2] + 1) == " ")
        #   (combo[2] + 1).to_s
        # elsif (board.position(combo[1] + 1) == self.token && board.position(combo[2] + 1) == self.token) && (board.position(combo[0] + 1) == " ")
        #   (combo[0] + 1).to_s
        # elsif (board.position(combo[0] + 1) == self.token && board.position(combo[2] + 1) == self.token) && (board.position(combo[1] + 1) == " ")
        #   (combo[1] + 1).to_s
        # else
        #   "1"
        end
      end
    end

    # binding.pry
  end
end
