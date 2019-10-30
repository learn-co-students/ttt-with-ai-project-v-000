module Players
  class Computer < Player
    def move(board)
      best = 0
      combinations = Game::WIN_COMBINATIONS
      corners = Game::CORNERS
      center = Game::CENTER
      opponent = self.token == "X" ? "O" : "X"
      positions = board.cells.map.with_index{ |cell, index| cell = index if cell == " " }
      available_positions = positions - [self.token] - [opponent]

      # loop through each winning combo and replace digits with elements
      # appearing on the board at that position. Check how far we are to
      # winning or losing in each combo and play offense to replace all 3
      # of a combo's digits with self.token to win or prevent opponent's token
      # from getting all 3 of a combo to lose.
      best_defense = []
      best_offense = []
      options = []
      combinations.map do |combo|
        option = []
        self_count = 0
        opp_count = 0
        combo.map.with_index do |el, index|
          if ![self.token, opponent].include?(positions[el])
            el = index
          elsif positions[el] == self.token
            el = positions[el]
            self_count += 1
          elsif positions[el] == opponent
            el = positions[el]
            opp_count += 1
          end
          option << el
        end
        # make defense and offense high priority arrays -
        # where either player has 2 spots out of a winning combo
        # options will be a lower priority array where offensive
        # player (player1) has 1 spot of a winning combo, this
        # will be used to further player1's offense strategy
        #if option.select{ |el| el == opponent }.length >= 2
        if self_count >= 2
          option.each do |opt|
            best_offense << opt unless [self.token, opponent].include? opt
          end
        elsif opp_count >= 2
          option.each do |opt|
            best_defense << opt unless [self.token, opponent].include? opt
          end
        elsif self_count == 1
          unless option.include? opponent
            option.each do |opt|
              options << opt unless opt == self.token
            end
          end
        end
      end

      # get all placement values from the positions array which starts from 1 not 0.
      # best is always center
      if positions.include?(center)
          best = center
      # else best is 3rd spot in a winning combo that has 2 filled already
      elsif best_offense.length > 0
        best = best_offense.sample
      # else best is blocking an opponent win
      elsif best_defense.length > 0
        # check if a blocking value appears in more than 1 combo,
        # if so this will be a high priority block
        check_best_defense = best_defense.detect { |x| best_defense.count(x) > 1 }
        if check_best_defense
          best = check_best_defense
        # or select any random blocking value
        else
          best = best_defense.sample
        end
      # else best is a combo in options that might include a future win
      elsif best_offense.empty? && best_defense.empty? && options.length > 0
        # check if value appears in 2 combos, will be high value offense strategy
        # or check for a corner option
        # or select random
        check_best_option = options.detect { |x| options.count(x) > 1 }
        if check_best_option
          best = check_best_option
        elsif !(options & corners).empty?
          best = (options & corners).first
        else
          best = options.sample
        end
      # if it's the beginning and only first player has played so far
      # check for available corners or if it's the end and no combos
      # have a possibility of winning, select any random available slot
      elsif best_offense.empty? && best_defense.empty? && options.empty?
        if !(available_positions & corners).empty?
          best = (available_positions & corners).sample
        else
          best = available_positions.sample
        end
      end
      (best + 1).to_s
    end
  end

end
