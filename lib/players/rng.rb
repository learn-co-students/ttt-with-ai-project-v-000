# This was the 3 minute attempt at AI. It was useful for fine-tuning the
# AdvancedAI because it would randomly perform real attack patterns. It was
# crucial in refining the #edge_attack package, as well as figuring out some
# board states to avoid. It now gets beaten 95+% of the time by the other 2 AIs.

module Players
  class RNG < Player

    def move(board)
      puts "Beep Borp! Making Moves *crackle*"
      i = 0
      until board.valid_move?(i)
        i = rand(1..9)
      end
      i.to_s
    end

    def open_the_podbay_doors(hal)
      "I'm sorry Dave. I'm afraid I can't do that."
    end

  end
end
