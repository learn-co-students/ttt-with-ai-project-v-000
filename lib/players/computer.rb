module Players
  class Computer < Player
    attr_accessor :board
    @@WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
    ]


    def move(board)
      @board = board
      if @board.valid_move?(5)
        return 5.to_s
      end
      @@WIN_COMBINATIONS.each do |wc|
        ar = [@board.cells[wc[0]], @board.cells[wc[1]], @board.cells[wc[2]]]
        tkn = ar.uniq.delete(" ")
        if tkn != nil
          if tkn.length == 1 && ar.delete(" ").length == 2
            wc.each do |val|
              if @board.valid_move?(val + 1)
                return (val + 1).to_s
              end
            end
          end
        end
      end
      corners = [1, 3, 7, 9]
      corners.each do |corner|
        if @board.valid_move?(corner)
          return corner.to_s
        end
      end
      edges = [2, 4, 6, 8]
      edges.each do |edge|
        if @board.valid_move?(edge)
          return edge.to_s
        end
      end
      end
    end
  end
