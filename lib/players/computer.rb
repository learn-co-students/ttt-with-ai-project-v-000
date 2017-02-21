module Players
  class Computer < Player

    def move(board)
      puts ""
      puts "AI bot '#{self.token} Player' is moving..."
      sleep 2
      tactics(board)
    end

    ################### AI LOGIC ###################
    private

    def tactics(board)
      turn = true
      x = "X"
      o = "O"

      o_coord = priority_objectives(board, o)
      if !o_coord.nil?
        return o_coord
      end

      x_coord = priority_objectives(board, x)

      if !x_coord.nil?
        return x_coord
      end

      while turn do
        rando = 1 + rand(8)
        if board.cells[rando] != "X" and board.cells[rando] != "O"

          board.cells[rando] = "#{self.token}"
          return rando.to_s
          turn false
        end
      end
    end

    def priority_objectives(board, token)
      Game::WIN_COMBINATIONS.each do |win|

        objectives = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]

        objectives.each do |priority|

          if (board.cells[win[priority[0]]] == token) and (board.cells[win[priority[1]]] == token)

            if board.cells[win[priority[2]]] == " "

              return win[priority[2]]
            end
          end
        end
      end
      return nil
    end
  end
end
