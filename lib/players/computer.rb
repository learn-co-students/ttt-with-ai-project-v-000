module Players
  class Computer < Player
    @@corners = ["1", "3", "7", "9"]
    @@sides = ["2", "4", "6", "8"]

    def self.corners
      @@corners
    end

    def self.sides
      @@sides
    end

    def move(board)
      puts "Computer's move"
      position = ""

      if self.check_win_combos(board) != ""
        position = self.check_win_combos(board)
      elsif board.valid_move?("5")
        position = "5"
      elsif self.corners_available?(board)
        position = self.check_corners(board)
      else
        until board.valid_move?(position)
          index = rand(0..3)
          position = self.class.sides[index]
        end
      end
      sleep(0.2)
      position
    end

    def check_corners(board)
      position = ""
      self.class.corners.each.with_index do |corner, i|
        if board.taken?(corner) && board.position(corner) != self.token
          if i == 0
            position = self.class.corners[3] if board.valid_move?(self.class.corners[3])
          else
            position = self.class.corners[i - 1] if board.valid_move?(self.class.corners[i -1])
          end
        end
      end
      if position == ""
        until board.valid_move?(position)
          index = rand(0..3)
          position = self.class.corners[index]
        end
      end
      position
    end

    def corners_available?(board)
      self.class.corners.any? {|corner| board.position(corner) == " "}
    end

    def check_win_combos(board)
      position = ""

      Game::WIN_COMBINATIONS.each do |combo|
        position_1 = index_to_position(combo[2])
        position_2 = index_to_position(combo[1])
        position_3 = index_to_position(combo[0])

        if positions_match?(board, position_1, position_2)
          position = position_3 if board.valid_move?(position_3)
        elsif positions_match?(board, position_1, position_3)
          position = position_2 if board.valid_move?(position_2)
        elsif positions_match?(board, position_2, position_3)
          position = position_1 if board.valid_move?(position_1)
        end
      end
      position
    end

    def index_to_position(index)
      (index + 1).to_s
    end

    def positions_match?(board, position_1, position_2)
      if board.valid_move?(position_1) || board.valid_move?(position_2)
        false
      elsif board.position(position_1) != self.token && board.position(position_2) != self.token
        true
      end
    end

  end
end
