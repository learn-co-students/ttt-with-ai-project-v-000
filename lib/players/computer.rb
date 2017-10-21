module Players
  class Computer < Player
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def move board
      puts "Computer #{self.token}'s turn:"
      board.display
      position = nil
      valid_moves = []
      WIN_COMBINATIONS.each do |combo|
        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " " && board.cells[combo[0]] != " "
          position = combo[2] + 1
          position = position.to_s
        elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " " && board.cells[combo[1]] != " "
          position = combo[1] + 1
          position = position.to_s
        elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " " && board.cells[combo[2]] != " "
          position = combo[0] + 1
          position = position.to_s
        end #if
      end #each

      if position == nil  
        board.cells.each_index do |cell|
          if board.cells[cell] == " "
            cell += 1
            valid_moves << cell.to_s
          end #if
        end #each
        
        until board.valid_move?(position) do
          index = rand(valid_moves.length-1)
          position = valid_moves[index]
        end #until
      end #if
      position
      
    end #def
  end #class
end #module

