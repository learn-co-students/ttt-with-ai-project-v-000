require_relative '../player.rb'
class Computer < Player
  WIN_COMBINATIONS=[[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6]]
  def move(board)
    
    move = winning_move?(board)
    if move != " "
      move + 1
    elsif board.turn_count < 4
      move_arr=["1", "3", "7", "9"]
        move_arr[rand(move_arr.length)]
    else
     rand(1..9)
   end
    # end
  end#end move

  def winning_move?(board)
    move=" "
    winning_array=[]
    valid=[]
    
    board.cells.each_with_index do |c, i| 
       if board.valid_move?(c)
        valid << i 
      end
    end
      
    valid.each do |cell|
      compare=board.cells.collect do |c|
        c
      end
    compare[cell] ="X"
        WIN_COMBINATIONS.each do |arr|
          if  compare[arr[0]] == "X" &&  compare[arr[1]] == "X" &&  compare[arr[2]] == "X" 
               
               winning_array=arr # return the win_combination indexes that won.
               # puts "this is the winning_array #{winning_array}"
          end
        end
    
    compare[cell] ="O"
        WIN_COMBINATIONS.each do |arr|
          if  
               compare[arr[0]] == "O" && compare[arr[1]] == "O" &&  compare[arr[2]] == "O"
               winning_array=arr # return the win_combination indexes that won.
               # puts "this is the winning_array #{winning_array}"
          end
        end



    end
       
    winning_array.each  do |cell|
      if board.valid_move?(cell+1)
         move = cell 
       end
    end
     move #return winning move
  end#end winning_move?

end#end class






