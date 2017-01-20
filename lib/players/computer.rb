module Players
  class Computer < Player
    # def initialize
      @@all = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
      @@verticals = [[0,1,2], [3,4,5], [6,7,8]]
      @@horizontals = [[0,3,6], [1,4,7], [2,5,8]]
      @@diagonals = [[0,4,8], [6,4,2]]

      @@center = 4
      @@corners = [0,2,6,8]
      @@middles = [1,3,5,7]
    # end

    def win(cells)
      wins = @@all.collect do |e|
        if e.collect{|t| cells[t]}.join.gsub(/\s+/, "")  == self.token + self.token
          e[e.index{|s| cells[s] == " "}]
        end
      end.compact!
      wins.count > 0 ? wins : false
    end

    def best_move(cells, turn = cells.count { |cell| cell != " "})
      options = []

      if turn == 0
        options.concat(@@corners)

      elsif turn == 1
        options << @@center


      elsif win(cells)
        options.concat(win(cells))
        puts options
      #  binding.pry
      # elsif block
      #   options << block
      #
      # elsif force
      #   options << force

      else
        options << cells.index(" ")
      end

      (options.shuffle.first + 1).to_s
    end

    def move(cells)
      best_move(cells)
    end
  end
end
