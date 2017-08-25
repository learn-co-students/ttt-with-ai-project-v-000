module Players #Ruby recognizes that there is only one Players module, even though it is split across different files.|
  class Computer < Player

    def move(array)

      if array.all? {|cell| cell == " "}
        try_move = "5"
      else

        WIN_COMBINATIONS.each do |combo|
          pos_1 = board.cells[combo[0]]
          pos_2 = board.cells[combo[1]]
          pos_3 = board.cells[combo[2]]

          try_for_combo

        try_move = (1+rand(8)).to_s
      end
      try_move
    end

  end

  def score_spots
    #looks at each win_combo to see which one has the most potential. (from pov of X)
      #if the combo is clear, has score of Zero
      #if combo has zero spots in it, has score of 0
      #if combo has one O, it has score of 0.
      #if combo has one X, it has score of 1.
      #if combo has one X and one O, it has score of O
      #if combo has two X, it has score of 2
      #if combo has two O, it has score of 3
      #assign each clear spot in that combo the score given
    #repeat, letting scores accumulate.
    #move on the spot that has the highest score.


end
