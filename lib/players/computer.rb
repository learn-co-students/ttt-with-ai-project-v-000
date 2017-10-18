require "pry"

module Players #Ruby recognizes that there is only one Players module, even though it is split across different files.|
  class Computer < Player

    def move(array)
      if array[4] == " "
        the_move = 5
      else
        evals = self.evaluate_board(array)
        evals = self.elim_invalid_moves(evals, array)
        the_move = self.best_move(evals)

      end
      the_move
    end


    def evaluate_board(layout)
      #looks at each win_combo to see which one has the most potential. (from pov of X)

      # def rate_positions
      position_ratings = [1, 0, 1, 0, 1, 0, 1, 0, 1]
      win_combos = Game::WIN_COMBINATIONS

        win_combos.each do |combo|
          pos_1 = layout[combo[0]]
          pos_2 = layout[combo[1]]
          pos_3 = layout[combo[2]]

          combo_status = [pos_1,pos_2, pos_3] #array of the tokens present in the current combo

          my_count = 0 #number of my own tokens in the current combo
          opp_count = 0 #number of opponents tokens in current combo

          combo_status.each do |pos|
            my_count += 1 if pos == self.token
            opp_count += 1 if pos == self.opp_token
          end

          if my_count == 0 && opp_count == 0        #if the combo is clear, has score of Zero
            #keep values the same
          elsif my_count == 0 && opp_count == 1     #if combo has one O, it has score of 0.
            #keep values the same
          elsif my_count == 1 && opp_count == 0     #if combo has one X, increment by 1 the ratings of each position.
            position_ratings[combo[0]] += 1
            position_ratings[combo[1]] += 1
            position_ratings[combo[2]] += 1
          elsif my_count == 1 && opp_count == 1     #if combo has one of each token, its rating is 0 because it cannot be used to win.
            #keep values the same
          elsif my_count == 2 && opp_count == 0     #if you can win using this combo, make it high priority
            position_ratings[combo[0]] += 6
            position_ratings[combo[1]] += 6
            position_ratings[combo[2]] += 6
          elsif my_count == 0 && opp_count == 2     #if you can lose if you dont play this, make it VERY high priority.
            position_ratings[combo[0]] += 4
            position_ratings[combo[1]] += 4
            position_ratings[combo[2]] += 4
          end

        end

      #repeat, letting scores accumulate.
      #eliminate from consideration those spots that are already taken
      #move on the spot that has the highest score.
      position_ratings
    end

    def elim_invalid_moves(position_ratings, layout)
      position_ratings.each_with_index do |pos, i|
        if layout[i] != " "
          position_ratings[i] = nil
        end
      end
    end

    def best_move(evals) #returns index of best move for computer to make.
      #if multiple equally good moves, randomly chooses from those move choices.
      max_score = evals.compact.max

      evals.each_with_index do |cell, i|
        evals[i] = nil if cell != max_score
      end

      indices = []

      evals.each_with_index do |cell, i|
        indices << i if cell != nil
      end

      chosen_move = (indices.sample) + 1 #chooses random item from indices

      chosen_move
    end


  end

end
