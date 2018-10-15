module Players
  class Computer < Player
    def move(board)
      sleep(2)
      count = 1
      valid = []
      board.cells.collect do |moves|
        if moves == " "
          valid << count.to_s
        end
          count += 1
      end
      if valid.include?("5")
        "5"
      else
      valid.sample
      end
    end
  end
end