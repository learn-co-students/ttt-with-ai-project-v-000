module TTTGame
 

  module ClassMethods
  end

  module InstanceMethods
     WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[6, 4, 2]]

 def all_X
    ex = []
    cells.each_with_index do |p, i| 
      if p == "X"
        ex << i
      end
    end
    ex
  end

  def all_O
    oh = []
    cells.each_with_index do |p, i| 
      if p == "O"
        oh << i
      end
    end
    oh
  end

=begin
    def won?
      WIN_COMBINATIONS.each do |winning_trio| 
      winning_trio_index_1 = winning_trio[0]
      winning_trio_index_2 = winning_trio[1]
      winning_trio_index_3 = winning_trio[2]

      pos_1 = board.cells[winning_trio_index_1]
      pos_2 = board.cells[winning_trio_index_2]
      pos_3 = board.cells[winning_trio_index_3]

      true if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      end
    end 

    def won?
      #ex = board.all_X
      #oh = board.all_O
      WIN_COMBINATIONS.any? |combo|
        combo.all? |i|
          board.all_X.include? i
        #combo.all? |j|
          #board.all_O.include? j
    end
    end
    end
  end
=end
  end
end
