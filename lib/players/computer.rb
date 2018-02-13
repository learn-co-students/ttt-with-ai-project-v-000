module Players
  class Computer < Player

    def move(board)
      if self.token == "X"
        opp = "O"
      else
        opp = "X"
      end

      puts "Watson is thinking..."
      sleep 2

      #Takes center square on first turn
      if board.turn_count == 0
        "5"
      #Winning rows
      # 1, 2, 3
      elsif board.position(1) == opp && board.position(2) == opp && !board.taken?("3")
        "3"
      elsif board.position(1) == opp && board.position(3) == opp && !board.taken?("2")
        "2"
      elsif board.position(2) == opp && board.position(3) == opp && !board.taken?("1")
        "1"
      # 4, 5, 6
      elsif board.position(4) == opp && board.position(6) == opp && !board.taken?("5")
        "5"
      elsif board.position(4) == opp && board.position(5) == opp && !board.taken?("6")
        "6"
      elsif board.position(5) == opp && board.position(6) == opp && !board.taken?("4")
        "4"
      # 7, 8, 9
      elsif board.position(7) == opp && board.position(8) == opp && !board.taken?("9")
        "9"
      elsif board.position(7) == opp && board.position(9) == opp && !board.taken?("8")
        "8"
      elsif board.position(8) == opp && board.position(9) == opp && !board.taken?("7")
        "7"
      #Winning columns
      #1, 4, 7
      elsif board.position(4) == opp && board.position(7) == opp && !board.taken?("1")
        "1"
      elsif board.position(1) == opp && board.position(7) == opp && !board.taken?("4")
        "4"
      elsif board.position(1) == opp && board.position(4) == opp && !board.taken?("7")
        "7"
      #2, 5, 8
      elsif board.position(2) == opp && board.position(8) == opp && !board.taken?("5")
        "5"
      elsif board.position(5) == opp && board.position(8) == opp && !board.taken?("2")
        "2"
      elsif board.position(2) == opp && board.position(5) == opp && !board.taken?("8")
        "8"
      #3, 6, 9
      elsif board.position(3) == opp && board.position(9) == opp && !board.taken?("6")
        "6"
      elsif board.position(3) == opp && board.position(6) == opp && !board.taken?("9")
        "9"
      elsif board.position(6) == opp && board.position(9) == opp && !board.taken?("3")
        "3"
      #Winning diagonals
      #1, 5, 9
      elsif board.position(1) == opp && board.position(9) == opp && !board.taken?("5")
        "5"
      elsif board.position(1) == opp && board.position(5) == opp && !board.taken?("9")
        "9"
      elsif board.position(5) == opp && board.position(9) == opp && !board.taken?("1")
        "1"
      #3, 5, 7
      elsif board.position(3) == opp && board.position(7) == opp && !board.taken?("5")
        "5"
      elsif board.position(3) == opp && board.position(5) == opp && !board.taken?("7")
        "7"
      elsif board.position(5) == opp && board.position(7) == opp && !board.taken?("3")
        "3"
      #Now take the first open corner spot
      elsif !board.taken?(1 || 3 || 7 || 9)
        corners = []
        [1, 3, 7, 9].each do |idx|
          if board.position(idx) == " "
            corners << idx.to_s
          end
        end
        corners.sample
      #Or just take a random empty spot
      else
        empties = []
        [1, 2, 3, 4, 5, 6, 7, 8, 9].each do |idx|
          if board.position(idx) == " "
            empties << idx.to_s
          end
        end
        empties.sample
      end
    end

  end
end
