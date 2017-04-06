require "pry"
module Players
  class Computer < Player
    attr_accessor :computer_move, :winning_combinations, :board

    def move(board)
      @board = board
      case board
      when !board.taken?(5)
        take_center
      when near_win?
        block_opponent_or_win
      when board.taken?(5)
        take_corner
      else
        self.computer_move = rand(1..9).to_s
      end
      self.computer_move
    end

    def take_center
      self.computer_move = 5.to_s
    end

    def take_corner
      random_num = rand(1..4)
      if random_num == 1
        self.computer_move = 1.to_s
      elsif random_num == 2
        self.computer_move = 3.to_s
      elsif random_num == 3
        self.computer_move = 7.to_s
      elsif random_num = 4
        self.computer_move = 9.to_s
      end
    end

    def near_win?
      Game::WIN_COMBINATIONS.detect do |combo|
        (self.board.cells[combo[0]] == self.board.cells[combo[1]] ||
        self.board.cells[combo[1]] == self.board.cells[combo[2]] ||
        self.board.cells[combo[0]] == self.board.cells[combo[2]]) &&
        (self.board.taken?(combo[0]+1) || self.board.taken?(combo[2]+1))
      end
    end

    def block_opponent_or_win
      combo = near_win?
      combo.each do |c|
        self.computer_move == (c + 1).to_s if !self.board.taken?(c+1)
      end
    end
  end
end
