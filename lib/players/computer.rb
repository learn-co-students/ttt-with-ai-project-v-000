require 'pry'
module Players
  class Computer < Player
    attr_accessor

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def move(board)
      puts "Computer is making it's move..."
      sleep(1)
      # rand(1..9).to_s
      case
      when winnable?(board)
        #make winning move
        # binding.pry
        winnable?(board)
      when defense?(board)
        #prevent opponent from winning next turn
        # binding.pry
        defense?(board)
      else
        #play best available space
        empty_spaces = available_moves(board)
        tier_1 = "5"
        tier_2 = ["1", "3", "7", "9"]
        tier_2_available = empty_spaces.select {|space| tier_2.include?(space)}
        tier_3 = ["2", "4", "6", "8"]
        tier_3_available = empty_spaces.select {|space| tier_3.include?(space)}
        # binding.pry
        if empty_spaces.include?(tier_1)
          return tier_1
        elsif tier_2_available.length > 0
          return tier_2_available.sample
        elsif tier_3_available.length > 0
          return tier_3_available.sample
        end
      end
    end

    def winnable?(board)
      WIN_COMBINATIONS.each do |combo|
        check_row = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
        if check_row.count(self.token) == 2 && check_row.include?(" ")
          winning_move = combo.detect {|space| board.cells[space] == " "}
          return winning_move + 1
        end
      end
      return nil
    end

    def defense?(board)
      if self.token == "X"
        opponent_token = "O"
      else
        opponent_token = "X"
      end
      WIN_COMBINATIONS.each do |combo|
        check_row = [board.cells[combo[0]], board.cells[combo[1]], board.cells[combo[2]]]
        if check_row.count(opponent_token) == 2 && check_row.include?(" ")
          defense_move = combo.detect {|space| board.cells[space] == " "}
          return defense_move + 1
        end
      end
      return nil
    end

    def available_moves(board)
      empty = []
      board.cells.each_with_index do |space, i|
        if space == " "
          position = i + 1
          empty << position.to_s
        end
      end
      empty
    end

  end

end
