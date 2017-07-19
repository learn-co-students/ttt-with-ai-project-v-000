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

      if check_win_combos(board) != ""
        position = check_win_combos(board)
      elsif board.valid_move?("5")
        position = "5"
      elsif corners_available(board)
        if check_corners(board) != ""
          position = check_corners(board)
        elsif check_corners(board) == ""
          until board.valid_move?(position)
            index = rand(0..3)
            position = self.class.corners[index]
          end
        end
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
      position
    end

    def corners_available(board)
      self.class.corners.any? {|corner| board.position(corner) == " "}
    end

    def check_win_combos(board)
      position = ""
      Game::WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = index_to_position(win_index_3)
        position_2 = index_to_position(win_index_2)
        position_3 = index_to_position(win_index_1)

        if compare_positions(board, position_1, position_2) == true
          position = position_3 if board.valid_move?(position_3)
        elsif compare_positions(board, position_1, position_3) == true
          position = position_2 if board.valid_move?(position_2)
        elsif compare_positions(board, position_2, position_3) == true
          position = position_1 if board.valid_move?(position_1)
        end
      end
      position
    end

    def index_to_position(index)
      (index + 1).to_s
    end

    def compare_positions(board, position_1, position_2)
      if board.valid_move?(position_1) == true || board.valid_move?(position_2) == true
        false
      elsif board.position(position_1) != self.token && board.position(position_2) != self.token
        true
      end
    end

  end
end
