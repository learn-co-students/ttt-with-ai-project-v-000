module Players
  class Computer < Player
    include Constable

    attr_accessor :difficulty

    def move(board)
      case difficulty
      when "easy"
        random(board)
      when "moderate"
        block(board)
      when "hard"
        hard(board)
      else
        block(board)
      end
    end

    def corner(board)
      (CORNERS.detect { |c| !board.taken?(c + 1) } + 1).to_s
    end

    def random(board)
      m = Random.new.rand(1..9).to_s
      random(board) unless board.valid_move?(m)
      m
    end

    def block(board)
      next_move = random(board)
      WIN_COMBINATIONS.each do |c|
        hold = [board.cells[c[0]], board.cells[c[1]], board.cells[c[2]]]
        if hold.count(" ") == 1 && hold.count(block_who) == 2
          next_move = (1 + c[hold.index(" ")]).to_s
        end
      end
      next_move
    end

    def block_who
      return "X" if self.token == "O"
      "O"
    end

    def fill(board)
      next_move = block(board)
      WIN_COMBINATIONS.each do |c|
        hold = [board.cells[c[0]], board.cells[c[1]], board.cells[c[2]]]
        if hold.count(" ") == 1 && hold.count(self.token) == 2
          next_move = (1 + c[hold.index(" ")]).to_s
        end
      end
      next_move
    end

    def hard(board)
      if board.turn_count < 3
        corner(board)
      else
        fill(board)
      end
    end
  end
end
