module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [2, 5, 8],
      [1, 4, 7],
      [0, 4, 8],
      [6, 4, 2]
    ].freeze

    CORNER_SITUATIONS = [
      [0, 5, 2], [0, 7, 2],
      [2, 3, 0], [2, 7, 8],
      [6, 1, 0], [6, 5, 8],
      [8, 1, 2], [8, 3, 6]
    ].freeze

    BETTER_CORNER_CONDITIONS = [
      [0, 2, 1, 6, 3],
      [2, 0, 1, 8, 5],
      [6, 0, 3, 8, 7],
      [8, 6, 7, 2, 5]
    ].freeze

    attr_accessor :cells, :composition, :turn_count, :board

    def move(board)
      self.cells = board.cells
      self.composition = board_composition
      self.turn_count = board.turn_count
      self.board = board

      token == 'X' ? x_move : o_move
    end

    def random_move
      m = check_for_comp(0, 2, 1)
      m ? m : random_space
    end

    def o_move
      return middle_or_corner if turn_count == 1

      m = o_turn_three if turn_count == 3
      return m if m

      # check if there is a winning move
      m = check_for_comp(0, 2, 1)
      return m if m

      # check if the opponent has a winning move
      m = check_for_comp(2, 0, 1)
      return m if m

      m = rand_corner
      return m if m

      random_space
    end

    def middle_or_corner
      cells[4] != 'X' ? '5' : %w[1 3 7 9].sample
    end

    def o_turn_three
      # x _ _     x _ o
      # _ o x  >  _ o X
      # _ _ _     _ _ _
      d = cells.map { |value| value == 'X' }
      m = CORNER_SITUATIONS.find { |a, b, c| d[a] && d[b] }
      return i2m(m[2]) if m

      # x _ _     x _ _
      # _ o _  >  o o _
      # _ _ x     _ _ x
      '4' if (d[0] && d[8]) || (d[2] && d[6])
    end

    def x_move
      return rand_corner if turn_count == 0
      return better_corner if turn_count == 2

      # check if there is a winning move
      m = check_for_comp(2, 0, 1)
      return m if m

      # check if the opponent has a winning move
      m = check_for_comp(0, 2, 1)
      return m if m

      m = better_corner
      return m if m

      random_space
    end

    def rand_corner
      i = [0, 2, 6, 8].find_all { |e| cells[e] == ' ' }.sample
      i2m(i) if i
    end

    def better_corner
      result = []
      BETTER_CORNER_CONDITIONS.each do |a, b, c, d, e|
        result << a unless (cells[b] == 'X' && cells[c] == 'O') || (cells[d] == 'X' && cells[e] == 'O')
      end
      i = result.find_all { |e| cells[e] == ' ' }.sample
      i2m(i) if i
    end

    def check_for_comp(x, o, b)
      to_check = { O: o, B: b, X: x }
      m = composition.each_with_index.find do |item, _index|
        item == to_check
      end
      move_to_out(m) if m
    end

    def move_to_out(m)
      # takes the index of the move, finds the blank space, adds one, and
      # converts to a string
      i = WIN_COMBINATIONS[m[1]].find { |i| cells[i] == ' ' }
      i2m(i)
    end

    def board_composition
      WIN_COMBINATIONS.map do |combo|
        result = { X: 0, O: 0, B: 0 }
        combo.each do |i|
          case cells[i]
          when 'X'
            result[:X] += 1
          when 'O'
            result[:O] += 1
          else
            result[:B] += 1
          end
        end
        result
      end
    end

    def i2m(i)
      (i + 1).to_s
    end

    def random_space
      %w[1 2 3 4 5 6 7 8 9].reject { |e| board.taken?(e) }.sample
    end
  end
end
