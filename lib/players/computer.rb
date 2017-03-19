module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # Left Column
      [1,4,7],  # Middle Column
      [2,5,8],  # Right Column
      [0,4,8],  # Diagnoal L to R
      [2,4,6]  # Diagnoal R to L
    ]

    @i = 0

    def move(board)

      for_the_win
      block_a_combo unless @i > 0
      # best_spots unless @i > 0

      board.cells.find do |c|
        if c == " "
          board.cells[@i] == self.token
          @i += 1
        end
      end
    "#{@i}"
    end

    def for_the_win
      WIN_COMBINATIONS.each do |combo|
        if combo[0] == combo[1] && combo[2] == " " && combo[0] == self.token
          @i = combo[2]
        elsif combo[1] == combo[2] && combo[0] == " " && combo[0] == self.token
          @i = combo[0]
        elsif combo[0] == combo[2] && combo[1] == " " && combo[0] == self.token
          @i = combo[1]
        else
          @i = 0
        end
      end
    end

    def block_a_combo
      WIN_COMBINATIONS.each do |combo|
        if combo[0] == combo[1] && combo[2] == " " && combo[0] != " "
          @i = combo[2]
        elsif combo[1] == combo[2] && combo[0] == " " && combo[0] != " "
          @i = combo[0]
        elsif combo[0] == combo[2] && combo[1] == " " && combo[0] != " "
          @i = combo[1]
        else
          @i = 0
        end
      end
    end

  # def best_spots
  #   [0, 2, 4, 6, 8].any? |i|
  #     if board[i] == " "
  #       @i = i
  #     end
  #   end
  # end

    # def no_combos(board)
    #   if !board.taken?(5)
    #     move = "5"
    #   elsif board.turn_count == 2
    #     move = [1, 3, 7, 9].detect do |i|
    #       !board.taken?(i).to_s
    #     end
    #   end
    # end

    # def win_move
    #   @two_token_combo.each do |combo|
    #     if (combo[0] || combo[1] || combo[2]) == self.token
    #       combo.each do |cell|
    #         position = nil
    #         if cell == " "
    #           position << cell
    #           move = (position+1).to_s
    #         end
    #       end
    #     else
    #       block_move
    #     end
    #   end
    # end

  #  def block_move
  #    @two_token_combo.each do |combo|
  #     if (combo[0] || combo[1] || combo[2]) == !self.token
  #       combo.each do |cell|
  #         position = nil
  #         if cell == " "
  #           position << cell
  #           move = (position+1).to_s
  #         end
  #       end
  #     end
  #   end
  # end

  end
end
