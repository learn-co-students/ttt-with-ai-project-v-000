require 'pry'

class Player::Computer < Player
attr_accessor :board

WIN_COMBINATIONS = [
[0,1,2], #Top Row
[3,4,5], #Middle Row
[6,7,8], #Bottom Row
[0,3,6], #left vert
[1,4,7], #middle vert
[2,5,8], #Right Vert
[0,4,8], #TL to RB diag
[2,4,6] #TR to BL diag
]



def move (board)
@board=board
if self.token=="X"
 x_strategy
else
  o_strategy
end
end
def x_strategy
if board.turn_count==0
 spot= "1"
elsif board.turn_count==2
  if board.taken?(5)==false
   spot= "5"
  else
   spot= "9"
  end
else 
  WIN_COMBINATIONS.each do |combos|

   if board.cells[combos[0]]=="X" && (board.cells[combos[0]] == board.cells[combos[1]]) && board.cells[combos[2]]== " "
    spot=(combos[2]+1).to_s
    
    break
    elsif board.cells[combos[1]]=="X" && (board.cells[combos[1]] == board.cells[combos[2]]) && board.cells[combos[0]]== " "
    spot=(combos[0]+1).to_s
    
    break
    elsif board.cells[combos[0]]=="X" && (board.cells[combos[0]] == board.cells[combos[2]]) && board.cells[combos[1]]== " "
    spot=(combos[1]+1).to_s
    
    break
     elsif board.cells[combos[0]]=="O" && (board.cells[combos[0]] == board.cells[combos[1]]) && board.cells[combos[2]]== " "
    spot=(combos[2]+1).to_s
   
    break
    elsif board.cells[combos[1]]=="O" && (board.cells[combos[1]] == board.cells[combos[2]]) && board.cells[combos[0]]== " "
    spot=(combos[0]+1).to_s
    
    break
    elsif board.cells[combos[0]]=="O" && (board.cells[combos[0]] == board.cells[combos[2]]) && board.cells[combos[1]]== " "
    spot=(combos[1]+1).to_s
   
    break
    else
      spot=(["9","2","7","3","6","8","4"].detect {|x| board.taken?(x)==false})
     
    end
  end
end
return spot
end

def o_strategy
  if board.turn_count==1
    if board.taken?("5")==false
     spot= "5"
    else
      spot= "1"
    end
   else 
     WIN_COMBINATIONS.each do |combos|
   if board.cells[combos[0]]=="O" && (board.cells[combos[0]] == board.cells[combos[1]]) && board.cells[combos[2]]== " "
    spot=(combos[2]+1).to_s
    
    break
    elsif board.cells[combos[1]]=="O" && (board.cells[combos[1]] == board.cells[combos[2]]) && board.cells[combos[0]]== " "
    spot=(combos[0]+1).to_s
    
    break
    elsif board.cells[combos[0]]=="O" && (board.cells[combos[0]] == board.cells[combos[2]]) && board.cells[combos[1]]== " "
    spot=(combos[1]+1).to_s
   
    break
     elsif board.cells[combos[0]]=="X" && (board.cells[combos[0]] == board.cells[combos[1]]) && board.cells[combos[2]]== " "
    spot=(combos[2]+1).to_s
  
    break
    elsif board.cells[combos[1]]=="X" && (board.cells[combos[1]] == board.cells[combos[2]]) && board.cells[combos[0]]== " "
    spot=(combos[0]+1).to_s
    
    break
    elsif board.cells[combos[0]]=="X" && (board.cells[combos[0]] == board.cells[combos[2]]) && board.cells[combos[1]]== " "
    spot=(combos[1]+1).to_s
  
    break
    else
      spot=(["9","2","7","3","6","8","4"].detect {|x| board.taken?(x)==false})
    
    end
  end
end
return spot
end
end
