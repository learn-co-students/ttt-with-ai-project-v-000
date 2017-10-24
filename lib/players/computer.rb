module Players
  class Computer < Player

    @@all = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    @@verticals = [[0,1,2], [3,4,5], [6,7,8]]
    @@horizontals = [[0,3,6], [1,4,7], [2,5,8]]
    @@diagonals = [[0,4,8], [6,4,2]]

    @@center = 4
    @@corners = [0,2,6,8]
    @@middles = [1,3,5,7]

    def tokn(cells)
        cells.count { |cell| cell != " "}.even? ? "X" : "O"
    end

    def opponent(cells)
      return "O" if cells == "X"
      return "X" if cells == "O"
      tokn(cells) == "X" ? "O" : "X"
    end

    def win(cells)
      wins = @@all.each_with_index.collect do |line, i|
        lined = line.collect{|e| cells[e]}.join.gsub(/\s+/, "")
        if lined == tokn(cells) + tokn(cells)
          line[line.index {|e| cells[e] == " "}]
        else
          nil
        end
      end.compact!
      wins if wins.count > 0
    end

    def block(cells)
      blocks = @@all.each_with_index.collect do |line, i|
        lined = line.collect{|e| cells[e]}.join.gsub(/\s+/, "")
        if lined == opponent(cells) + opponent(cells)
          line[line.index {|e| cells[e] == " "}]
        else
          nil
        end
      end.compact!
      blocks if blocks.count > 0
    end

    def double(cells)
      @@all.each_with_index do |line, i|
        lined = line.collect{|e| cells[e]}.join.gsub(/\s+/, "")

        if lined == tokn(cells)
          line.each do |cell|
            temp_cells = cells.dup
            temp_cells[cell] = tokn(cells)
            if block(temp_cells) and block(temp_cells).count > 1
              return cell
            end
          end
        end
      end
      nil
    end

    def force(cells)
      orig_token = tokn(cells)
      #get a list of 'singles'
      singles = @@all.each_with_index.collect do |line, i|
        lined = line.collect{|e| cells[e]}.join.gsub(/\s+/, "")
        lined == tokn(cells) ? i : nil
      end.compact!
      #iterate through 'singles' lines
      singles.each do |line_i|
        #drop a token in cell
        @@all[line_i].each do |cell_i|
          next if cells[cell_i] != " "
          temp_cells = cells.dup
          temp_cells[cell_i] = tokn(temp_cells)
          tmp_game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'))
          tmp_game.board.cells = temp_cells
          while tmp_game.won? == nil && tmp_game.draw? == false do
            tmp_game.turn
          end
          if tmp_game.won? != nil && tmp_game.winner == orig_token
            return cell_i
          end
        end
      end
      nil
    end

    def avoid_force(cells)
      safe_spots = cells.each_with_index.collect do |e, i|
        next if e != " "
        temp_cells = cells.dup
        temp_cells[i] = tokn(temp_cells)
        force(temp_cells) == nil ? i : nil
      end.compact!
      safe_spots if safe_spots.count > 0
    end

    def best_move(cells)
      turn = cells.count { |cell| cell != " "}
      options = []

      if turn == 0
        options.concat(@@corners)

      elsif turn == 1 and cells[4] == " "
        options << @@center

      elsif win(cells)
        options.concat(win(cells))

      elsif block(cells)
        options.concat(block(cells))

      elsif double(cells)
        options << double(cells)

      elsif force(cells)
        options << force(cells)

      elsif turn == 3 and avoid_force(cells)
        options.concat(avoid_force(cells))

      elsif turn >= 1 and cells[4] == " "
        options << @@center

      else
        options << cells.index(" ")
      end

      (options.shuffle.last + 1).to_s
    end

    def move(cells)
      best_move(cells.dup)
    end
  end
end
