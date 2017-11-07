#require_relative '../player.rb'

module Players
  class Computer < Player
    attr_reader :board
    def move(board)
      #random level
      open_cells = []
        board.cells.each_with_index{|e,i|
        if e == " "
          open_cells << i + 1
        end
      }
      s = open_cells.sample.to_s
      puts "#{self.token} picks square #{s}."
      s
    end
  end
end

#hal = Players::Computer.new("O")
#puts hal.move(["X"," "," "," ","O","X"," "," "," "])
