require 'pry'

module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,4,8],
      [2,4,6],
      [0,3,6],
      [1,4,7],
      [2,5,8]
    ]
    def initialize(token)
      super(token)
      @blanks = []
      @player = []
      @opponent = []
    end

    def move(board)
      move_number = 0

      if find_defense_spot(board)
        puts "Defensing"
        move_number = find_defense_spot(board)
      elsif find_offense_spot(board)
        puts "It's time!"
        move_number = find_offense_spot(board)
      else
        puts "Finding best"
        move_number = find_best_spot(board)
      end
      (move_number.to_i+1).to_s
    end

    def reset_board_stores
      @blanks.clear
      @player.clear
      @opponent.clear
    end

    def board_space_update(board)
      reset_board_stores
      board.cells.each_with_index do |cell, index|
        if cell == " "
          @blanks << index
        elsif cell == self.token
          @player << index
        else
          @opponent << index
        end
      end
    end

    def find_defense_spot(board)
      #update @player, @opponent, @blanks instance variables
      board_space_update(board)
      require_def = []

      #if the opponent has made fewer than two moves, nothing to check for
      if @opponent.length < 2
        move_option = nil
      else

        non_player_combos = win_not_include(@player)
        #remove all combos that at least one of the items in win_combo have a player token
        #WIN_COMBINATIONS.each do |combo|
        #  @player.each do |player_ind|
        #    if !combo.include?(player_ind)
        #       non_player_combos << combo
        #    end
        #  end
        #end

        #for all the remaining possible opponent wins, check that the @opponent contains two of the elements of combo
        non_player_combos.each do |combo|
          if (combo-@opponent).length == 1
            require_def << (combo-@opponent)[0]
          end
        end

        #if there exists one or more location that requires defense, choose the first
        if (require_def & @blanks).length >0
          move_option = (require_def & @blanks).first.to_i
        else #if no defense is required return nil
          move_option = nil
        end
      end

      move_option #return your move selection
    end

    def win_not_include(player_or_opponent) #if given @player or @opponent, returns all the win conditions that don't any of their spots
      remaining_conditions = []
      WIN_COMBINATIONS.each do |combo|
        player_or_opponent.each do |index|
          if !combo.include?(index)
            remaining_conditions << combo
          end
        end
      end
      remaining_conditions
    end

    def find_offense_spot(board)
      board_space_update(board)
      require_offense = []

      #if the opponent has made fewer than two moves, nothing to check for
      if @player.length <2
        move_option = nil
      else
        non_opponent_combos = win_not_include(@opponent)
        #for all the remaining possible opponent wins, check that the @opponent contains two of the elements of combo
        non_opponent_combos.each do |combo|
          if (combo-@player).length == 1
            require_offense << (combo-@player)[0]
          end
        end

        #if there exists one or more location that requires defense, choose the first
        if (require_offense & @blanks).length >0
          move_option = (require_offense & @blanks).first.to_i
        else #if no defense is required return nil
          move_option = nil
        end
      end

      move_option #return your move selection
    end

    def find_best_spot(board)
      board_space_update(board)
      viable_wins = []
      #goes through all of the win combinations and takes out combos with opponent's token

      if @opponent.length == 0 #if opponent has yet to make a move, all combos are viable
        viable_wins = WIN_COMBINATIONS.dup
      else #check which combos do not have an opponent token
        viable_wins = win_not_include(@opponent)
        #WIN_COMBINATIONS.each do |combo|
        #  opponent.each do |opp_ind|
        #    if !combo.include?(opp_ind)
        #      viable_wins << combo
        #    end
        #  end
        #end
      end
      if viable_wins.length == 0# if there are no viable wins, just make any blank move
        move_number = blanks.first
      else
        #identifies the space with the highest appearances in viable win conditions
        total_win_spaces = viable_wins.flatten
        freq = total_win_spaces.inject(Hash.new(0)) {|item,value| item[value] +=1; item}
        simple_win_spaces = total_win_spaces.sort_by {|value| freq[value]}.uniq.reverse
        if @player.length == 0
          simple_win_spaces.delete(4)
        end
        clean_win_spaces = simple_win_spaces & @blanks

        move_number = clean_win_spaces.find{|move_num| !@player.include?(move_num)}
      end
    end

  end
end
