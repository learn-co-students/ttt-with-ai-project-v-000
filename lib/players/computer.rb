module Players
  class Computer < Player
    attr_accessor :cells, :board, :results
    attr_reader :opponent

    def initialize(token)
      super
      if token == "X"
        @opponent = "O"
      else
        @opponent = "X"
      end
    end

    def move(board)
      @cells = board.cells

      if first_turn
        corners.sample

      elsif second_turn
        !board.taken?("5") ? "5" : corners.sample

      elsif third_turn
        if board.position("5") == @opponent
          opposite_corner(my_corner)
        elsif opp_sides != false
          corners.sample
        end

      elsif i_can_win! != nil
        missing_piece(i_can_win!)

      elsif block_needed != nil
        missing_piece(block_needed)

      elsif upcoming_fork?
        sides.sample

      else
        corners.sample
      end
    end


    def first_turn
      self.cells.all?{|x| x==" "}
    end

    def second_turn
      self.cells.count{|x| x != " "} == 1
    end

    def third_turn
      self.cells.count{|x| x != " "} == 2
    end

    def corners
      ["1","3","7","9"]
    end

    def sides
      ["2","4","6","8"]
    end

    def my_corner
      corners.select do |x|
        self.cells[x.to_i-1] == self.token
      end
    end

    def opp_sides
      sides.find do |x|
        self.cells[x.to_i-1] == @opponent
      end
    end

    def opposite_corner(opp_of)
      if opp_of.include?("1")
        return "9"
      elsif opp_of.include?("3")
        return "7"
      elsif opp_of.include?("7")
        return "3"
      elsif opp_of.include?("9")
        return "1"
      end
    end

    def i_can_win!
      if combo != nil && @results.include?(self.token) && !@results.include?(@opponent)
        return combo
      end
    end

    def block_needed
      if combo != nil && @results.include?(@opponent) && !@results.include?(self.token)
        return combo
      end
    end

    def combo
      Game::WIN_COMBINATIONS.find do |combo|
        one = self.cells[combo[0]]
        two = self.cells[combo[1]]
        three = self.cells[combo[2]]
        @results = [one,two,three]
        if (one == two || one == three || two == three) && (results.count{|x| x == " "} == 1)
          return combo
        end
      end
    end

    def missing_piece(combo)
      combo.each do |x|
        if self.cells[x] == " "
          return (x+1).to_s
        end
      end
    end

    def upcoming_fork?
      (self.cells[0] == self.cells[8] && self.cells[0] != " ") || (self.cells[2] == self.cells[6] && self.cells[2] != " ")
    end
  end
end
