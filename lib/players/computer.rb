module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    CORNERS = [0,2,6,8]

### Optimpal Strategy reference: wikipedia ###
# 1) Go for win.
# 2) Block opponent win.
# 3) Get the center.
# 4) Get corner.
# 5) Line up a win.
    def move(board)
      if win?(board)
        (win?(board) + 1).to_s
      elsif block? board
        (block?(board) + 1).to_s
      elsif board.cells[4] == ' '
        "5"
      elsif corner? board
        (corner?(board).sample + 1).to_s
      else
        loop do
          move = (((rand*8).round)+1).to_s
          break if board.valid_move?(move)
        end
        return move
      end
    end

    def win?(board)
      win_pos = nil
      WIN_COMBINATIONS.each do |win_combo|
        mapped_cells = win_combo.map {|i| board.cells[i]}
        if mapped_cells.count(self.token) == 2 && mapped_cells.count(' ') == 1
           win_pos = win_combo[mapped_cells.index(' ')]
         end
       end
       return win_pos
     end

     def block?(board)
       win_pos = nil
       WIN_COMBINATIONS.each do |win_combo|
         mapped_cells = win_combo.map{|i| board.cells[i]}
         if mapped_cells.count(opposite_token) == 2 && mapped_cells.count(' ') == 1
           win_pos = win_combo[mapped_cells.index(' ')]
         end
       end
       win_pos
     end

     def opposite_token
       token == "X" ? "O" : "X"
     end

     def corner?(board)
       corners_avail = CORNERS.select{|a| board.cells[a] == ' '}
       if corners_avail.empty?
         nil
       else
         corners_avail
       end
     end

   end
 end
