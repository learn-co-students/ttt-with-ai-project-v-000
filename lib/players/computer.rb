class Computer < Player

  def move(board = nil)
    better_move(board)
  end


  def better_move(board)
    #TODO improve AI
    b = board

    c = b.cells

    ##rows

    row_1 = c[0..2]
    row_2 = c[3..5]
    row_3 = c[6..8]

    #columns 
    col_1 = []
    col_1 << c[0] 
    col_1 << c[3]
    col_1 << c[6]

    col_2 = []
    col_2 << c[1] 
    col_2 << c[4]
    col_2 << c[7]

    col_3 = []
    col_3 << c[2] 
    col_3 << c[5]
    col_3 << c[8]


    #row logic

    r1 = row_1.select {|cell| cell == "X" }
    r1_full = false
    r1_w_o = row_1.select {|cell| cell == "X" || cell == "O" }
    r1_w_o.length == 3 ? r1_full = true :  r1_full = false
    
    r2 = row_2.select {|cell| cell == "X" }
    r2_full = false
    r2_w_o = row_2.select {|cell| cell == "X" || cell == "O" }
    r2_w_o.length == 3 ? r2_full = true :  r2_full = false

    r3 = row_3.select {|cell| cell == "X" }
    r3_full = false
    r3_w_o = row_3.select {|cell| cell == "X" || cell == "O" }
    r3_w_o.length == 3 ? r3_full = true :  r3_full = false


    #column logic

    c1 = col_1.select {|cell| cell == "X" }
    c1_full = false
    c1_w_o = col_1.select {|cell| cell == "X" || cell == "O" }
    c1_w_o.length == 3 ? c1_full = true :  c1_full = false

    c2 = col_2.select {|cell| cell == "X" }
    c2_full = false
    c2_w_o = col_2.select {|cell| cell == "X" || cell == "O" }
    c2_w_o.length == 3 ? c2_full = true :  c2_full = false

    c3 = col_3.select {|cell| cell == "X" }
    c3_full = false
    c3_w_o = col_3.select {|cell| cell == "X" || cell == "O" }
    c3_w_o.length == 3 ? c3_full = true :  c3_full = false

   
    if r1.length == 2 && !r1_full
      row_1.each do |x|
        if x != "X"
         num = row_1.index(x) + 1
         return num.to_s
        end
      end
    elsif r2.length == 2 && !r2_full
      row_2.each do |x|
        if x != "X"
         num = row_2.index(x) + 1 + 3 #the three is to take account for the first row
         return num.to_s
        end
      end
    elsif r3.length == 2 && !r3_full
     row_3.each do |x|
      if x != "X"
       num = row_3.index(x) + 1 + 6 #the six is to take account for the first two rows
       return num.to_s
      end
    end
    elsif c1.length == 2 && !c1_full
      col_1.each do |x|
        if x != "X"
          num = col_1.index(x) 
          if num == 0
            return "1"
          elsif num == 1
            return "4"
          else
            return "7"
          end
        end
      end
    elsif c2.length == 2 && !c2_full
      col_2.each do |x|
        if x != "X"
          num = col_2.index(x) 
          if num == 0
            return "2"
          elsif num == 1
            return "5"
          else
            return "8"
          end
        end
      end
    elsif c3.length == 2 && !c3_full
      col_3.each do |x|
        if x != "X"
          num = col_3.index(x) 
          if num == 0
            return "3"
          elsif num == 1
            return "6"
          else
            return "9"
          end
        end
      end
    else
     
     other_num(b)

    end

  end # <-- end method

  def other_num(board)
    b = board
    num = rand(1..9)
    if !b.taken?(num)
      return num.to_s
    else
      other_num(b)
    end
  end

end