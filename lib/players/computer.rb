module Players
  class Computer < Player
    attr_accessor :cells

    def move(board)
      self.cells = board.cells # dirty but I don't care to rail against the spec
      (1..9).to_a.sample.to_s
    end

    def block?
      # returns the index of a space you must block, or nil if there isn't one
      block = [" ", "X", "X"]
      Game.WIN_COMBINATIONS.each do |combo|
        seq = [self.cells[combo[0]], self.cells[combo[1]], self.cells[combo[2]]]
        if seq.sort == block
          return combo[seq.index(" ")]
        end
      end
      nil
    end
  end
end
