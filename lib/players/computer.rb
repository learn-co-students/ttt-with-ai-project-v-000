module Players
  class Computer < Player
    def move(board)
      board.display
      i = (1..9).to_a
      i.delete_if{|j| board.taken?(j)}
      
      dboard = board.cells.dup
      win_comp = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [2,4,6]]
      
      w = i.find do |j|
        comb = [
          [0,1], [0,2], [1,2],
          [3,4], [3,5], [4,5],
          [6,7], [6,8], [7,8],
          [0,3], [0,6], [3,6],
          [2,5], [2,8], [5,8],
          [1,4], [1,7], [4,7],
          [0,4], [0,8], [4,8],
          [2,4], [2,6], [4,6]]
        comb.delete_if{|n| n.include?(j)}
        comb.find do |n|
          [dboard[n[0]], dboard[n[1]]].all?{|m| m == token} && win_comp.include?([j-1,n[0],n[1]].sort)
        end
      end
      # binding.pry
      return w if w != nil
      
      board.turn_count.even? ? opp = "O" : opp = "X"
      w = i.find do |j|
        comb = [
          [0,1], [0,2], [1,2],
          [3,4], [3,5], [4,5],
          [6,7], [6,8], [7,8],
          [0,3], [0,6], [3,6],
          [2,5], [2,8], [5,8],
          [1,4], [1,7], [4,7],
          [0,4], [0,8], [4,8],
          [2,4], [2,6], [4,6]]
        comb.delete_if{|n| n.include?(j)}
        comb.find do |n|
          [dboard[n[0]], dboard[n[1]]].all?{|m| m == opp} && win_comp.include?([j-1,n[0],n[1]].sort)
        end
      end
      # binding.pry
      return w if w != nil
      
      return "5" if i.include?(5)
      
      if i.find{|j| j == 1 || j == 3 || j == 7 || j == 9}
        i.select{|j| j == 1 || j == 3 || j == 7 || j == 9}.sample.to_s
      else 
        i.sample.to_s
      end
    end
  end
end
