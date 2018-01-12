require_relative "../player.rb"
require_relative "../board.rb"

module Players

  WIN_COMBINATIONS = [
    [2,5,8],   # Right Col
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,4,8],  # Diagonal Left Top to Right Bottom
    [2,4,6],  # Diagonal Right Top to Left Bottom
    [0,3,6],  # Left Col
    [1,4,7]  # Middle Col
  ]

  class Computer < Player

    #Basic Intelligence
    # def move(board)
    #   num = 1 + rand(9)
    #   #puts "Initial Num = #{num}"
    #   while !(board.valid_move?(num))
    #     num = 1 + rand(9)
    #     #puts "New Num = #{num}"
    #   end
    #   #puts "Return num = #{num}"
    #   "#{num}"
    # end

    #Medium Intelligence -- check player moves against Win Combinations and always interrupt possibles or random
    def move(board)
      # Get board set up
      player_moves = []
      player_moveIndex = []
      possible_moves = []
      board.cells.each_with_index do |space, index|
        if space != " " && space != @token
          player_moves << space
          player_moveIndex << index
        elsif space == " "
          possible_moves << index
        end
      end
      #DEBUG puts "Player Moves = #{player_moves}"
      #DEBUG puts "Player Indexes = #{player_moveIndex}"
      #DEBUG puts "Possible Moves = #{possible_moves}"
      #player_moves

      # Check player moves against Win combinations
      win_combo_hash = {}
      WIN_COMBINATIONS.each_with_index do |combo, index|
        win_combo_hash[index] = (combo & player_moveIndex)
      end
      #DEBUG puts "win_combo_hash = #{win_combo_hash}"
      win_combo_hash

      # Determine highest priority defense win combination
      sorted_win_combos = win_combo_hash.sort_by { |index, array| array.length }
      #DEBUG puts "sorted_win_combos = #{sorted_win_combos}"
      move_combination = sorted_win_combos.last[0]
      #DEBUG puts "highest priority combo = #{sorted_win_combos.last} || #{move_combination}"
      WIN_COMBINATIONS[move_combination]
      #DEBUG puts "Win Combo Selection = #{WIN_COMBINATIONS[move_combination]}"

      # Try moves that belong to the highest priority defense win combination
      i = 0
      computer_move = WIN_COMBINATIONS[move_combination][i]
      #DEBUG puts "Initial Comp Move = #{computer_move}"
      while !(board.valid_move?(computer_move+1))
        if i < 2
          #DEBUG puts "Try Next Win Combo Index | i = #{i}"
          i += 1
          computer_move = WIN_COMBINATIONS[move_combination][i]
        else
          #DEBUG puts "possible moves = #{possibles = possible_moves.length}"
          num = 1 + rand(possible_moves.length)
          computer_move = num
        end
        #DEBUG puts "New Comp Move = #{computer_move}"
      end
      #DEBUG puts "Return Comp Move = #{computer_move}"
      "#{computer_move}"
    end

    #Advanced Intelligence -- check player moves against Win Combinations and always interrupt possibles in descending order
    # Note : Would be the same as the above but with a modified "else" directly above this (in regards to figuring out the next priority move - defensive vs offensive)

  end

end


#Referenced Labs
# ruby-super-inheritance-lab-v-000

#Referenced Links
# https://stackoverflow.com/questions/198460/how-to-get-a-random-number-in-ruby
# https://stackoverflow.com/questions/10230227/find-values-in-common-between-two-arrays
