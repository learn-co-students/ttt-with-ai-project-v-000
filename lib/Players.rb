class Players
  class Human < Player
    def move(board)
      print "Put num: "
      gets.chomp
    end
  end

  class Computer < Player
    attr_accessor :available_moves, :pos_taken, :board

    def move(board)
      sleep(1)
      board.turn_count <= 5 ? Random.rand(1..10).to_s : self.strategy
    end

    def search_moves
      self.available_moves = []
      self.pos_taken = []
      self.board.cells.each.with_index do |val,index|
        if val == " "
          self.available_moves << index
        elsif val == self.token
          self.pos_taken << index
        end
      end
    end

    def strategy
      begin
        self.board.WIN_COMBINATIONS.each do |win_combination|
          win_combination.detect.with_index do |x,i|
            x == self.token && self.available_moves.include?(x)
          end
        end
      rescue
        puts "Resign."
        exit
      end
    end
  end

end
