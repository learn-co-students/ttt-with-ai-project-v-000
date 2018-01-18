require "pry"
module Players
  class Computer < Player

    attr_reader :difficulty

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    def initialize(token, difficulty = 1)
      @token = token
      @difficulty = difficulty
    end

    def move(board)
      if self.difficulty == 1
        return self.block_check(board) unless self.block_check(board) == nil
        return self.win_check(board) unless self.win_check(board) == nil
        self.random_move(board, (0..8).to_a)
      elsif self.difficulty == 2
        return self.win_check(board) unless self.win_check(board) == nil
        return self.block_check(board) unless self.block_check(board) == nil
        self.random_move(board, (0..8).to_a)
      elsif self.difficulty == 3
        return self.win_check(board) unless self.win_check(board) == nil
        return self.block_check(board) unless self.block_check(board) == nil
        return self.openings(board) unless self.openings(board) == nil
        self.random_move(board, (0..8).to_a)
      elsif self.difficulty == 4
        return self.win_check(board) unless self.win_check(board) == nil
        return self.block_check(board) unless self.block_check(board) == nil
        return self.corners_over_sides(board) unless self.corners_over_sides(board) == nil
        self.random_move(board, (0..8).to_a)
      else
        return self.win_check(board) unless self.win_check(board) == nil
        return self.block_check(board) unless self.block_check(board) == nil
        return self.openings(board) unless self.openings(board) == nil
        return self.corners_over_sides(board) unless self.corners_over_sides(board) == nil
        self.random_move(board, (0..8).to_a)
      end
    end

    def random_move(board, possible_indexes)
      valid = false
      while !valid && possible_indexes.length > 0
        rand_num = rand(possible_indexes.length)
        if board.cells[possible_indexes[rand_num]] == " " || nil
          return "#{possible_indexes[rand_num]+1}"
          valid = true
        else
          possible_indexes.delete_at(rand_num)
        end
      end
    end

    def win_check(board)
      WIN_COMBINATIONS.each do |win|
        if board.cells[win[0]] == self.token && board.cells[win[1]] == self.token && board.cells[win[2]] == " "
          return "#{win[2]+1}"
        elsif board.cells[win[1]] == self.token && board.cells[win[2]] == self.token && board.cells[win[0]] == " "
          return "#{win[0]+1}"
        elsif board.cells[win[0]] == self.token && board.cells[win[2]] == self.token && board.cells[win[1]] == " "
          return "#{win[1]+1}"
        end
      end
      nil
    end

    def block_check(board)
      self.token == "X" ? opponent_token = "O" : opponent_token = "X"
      WIN_COMBINATIONS.each do |win|
        if board.cells[win[0]] == opponent_token && board.cells[win[1]] == opponent_token && board.cells[win[2]] == " "
          return "#{win[2]+1}"
        elsif board.cells[win[1]] == opponent_token && board.cells[win[2]] == opponent_token && board.cells[win[0]] == " "
          return "#{win[0]+1}"
        elsif board.cells[win[0]] == opponent_token && board.cells[win[2]] == opponent_token && board.cells[win[1]] == " "
          return "#{win[1]+1}"
        end
      end
      nil
    end

    def openings(board)
      if board.turn_count == 0
        return random_move(board, [0,2,6,8])
      elsif board.cells[4] == " "
        return "5"
      end
      nil
    end

    def corners_over_sides(board)
      if board.cells[4] != self.token
        return random_move(board, [0,2,6,8])
      elsif board.cells[4] == self.token
        return random_move(board, [1,3,5,7])
      end
      nil
    end

  end
end
