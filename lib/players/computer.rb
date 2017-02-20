module Players
  class Computer < Player

    def initialize(token)
      @token = token
    end

    def move(board)

      puts ""
      puts "Robot ('#{self.token}' Player) is taking turn..."
      sleep 2

      position = tactics(board)
      board.cells[position] = "#{self.token}"

      if @game.won?
        puts ""
        board.display
        @game.winner
      end

      puts ""
      board.display
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
          return rando
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

    def switch(token)
      self.token == 'X' ? 'O' : 'X'
    end

  end
end
