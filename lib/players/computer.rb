module Players
  class Computer < Player

    @@all = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    @@verticals = [[0,1,2], [3,4,5], [6,7,8]]
    @@horizontals = [[0,3,6], [1,4,7], [2,5,8]]
    @@diagonals = [[0,4,8], [6,4,2]]

    @@center = 4
    @@corners = [0,2,6,8]
    @@middles = [1,3,5,7]

    # @@current_board = []

    def opponent(current)
      return "O" if current == "X"
      return "X" if current == "O"
      current.token == "X" ? "O" : "X"
    end

    def meta_iteration(cells, search)

    end

    def win(cells, token = self.token)
      wins = @@all.collect do |e|
        if e.collect{|t| cells[t]}.join.gsub(/\s+/, "")  == token + token
          e[e.index{|s| cells[s] == " "}]
        end
      end.compact!
      wins.count > 0 ? wins : false
    end

    def block(cells, token = opponent(self))
      wins = @@all.collect do |e|
        if e.collect{|t| cells[t]}.join.gsub(/\s+/, "")  == token + token
          e[e.index{|s| cells[s] == " "}]
        end
      end.compact!
      wins.count > 0 ? wins : false
    end

    def double(cells, token = self.token)
      doubles = cells.each_with_index.collect do |x, i|
        if x != " "
          nil
        else
          temp = cells.dup
          temp[i] = token
          win(temp, token) && win(temp, token).count > 1 ? i : nil
        end
      end.compact!
      doubles.count > 0 ? doubles : false
    end

    def force(cells)
      def ng(cells)
        brd = Board.new
        brd.cells = cells.dup
        gm = Game.new(Players::Computer.new('X'), Players::Computer.new('O'), brd)
      end

      gm = ng(cells)
      current = gm.current_player
      opponent(current)

      gm.board.cells.each_with_index do |e, i|
        if e == " "
          temp_gm = ng(cells)
          temp_gm.board.cells[i] = current.token
          if temp_gm.board.full?
            return false
          else
            temp_gm.turn
            return i if double(temp_gm.board.cells, current.token)
          end
        end
      end
      false
    end

    def best_move(cells, turn = cells.count { |cell| cell != " "})
      options = []

      if turn == 0
        options.concat(@@corners)

      elsif turn >= 1 && cells[4] == " "
        options << @@center

      elsif win(cells)
        options.concat(win(cells))

      elsif block(cells)
        options.concat(block(cells))

      elsif double(cells)
        options.concat(double(cells))

      elsif force(cells)
        options << force(cells)

      elsif block_force(cells)
        cells[block_force(cells)] = "T"
        options << cells.index(" ")
        
      else
        options << cells.index(" ")
      end

      (options.shuffle.last + 1).to_s
    end

    def move(cells)
      # @@current_board = cells
      best_move(cells.dup)
    end
  end
end
