class Player::Computer < Player 
 attr_accessor :board, :game 
   WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],
[1,4,7], [2,5,8], [0,4,8], [6,4,2]]  

def move(arr)                           
   if self.token == "X"
     opp_token = "O"
   else 
     opp_token = 'X'
   end 

  WIN_COMBINATIONS.each { |x|
    
   if arr.cells[x[0]] == arr.cells[x[1]] && arr.cells[x[1]] == opp_token && arr.cells[x[2]] == " " 
      r = x[2]+1
      return  r.to_s

  elsif arr.cells[x[2]] == arr.cells[x[1]] && arr.cells[x[1]] == opp_token && arr.cells[x[0]] == " "
      r = x[0]+1
      return r.to_s
  elsif arr.cells[x[0]] == arr.cells[x[2]] && arr.cells[x[2]] == opp_token && arr.cells[x[1]] == " "
      
      r = x[1]+1 
      return r.to_s
    end 

  }
                                                                                                     
   WIN_COMBINATIONS.each{ |x|
     
   if arr.cells[x[0]] == arr.cells[x[1]] && arr.cells[x[1]] == self.token && arr.cells[x[2]] == " " 
      r = x[2]+1
      return  r.to_s

  elsif arr.cells[x[2]] == arr.cells[x[1]] && arr.cells[x[1]] == self.token && arr.cells[x[0]] == " "
      r = x[0]+1
      return r.to_s
  elsif arr.cells[x[0]] == arr.cells[x[2]] && arr.cells[x[2]] == self.token && arr.cells[x[1]] == " "
       
      r = x[1]+1 
      return r.to_s
    end 
   }

    WIN_COMBINATIONS.each{ |x| 
  if arr.cells[x[0]] ==  self.token  &&   arr.cells[x[1]] == " " && arr.cells[x[2]] == " "
      r = x[1] +1
      return r.to_s
  elsif arr.cells[x[1]] ==  self.token  &&   arr.cells[x[2]] == " " && arr.cells[x[0]] == " "
      r = x[2]+1
      return r.to_s
  elsif arr.cells[x[2]] ==  self.token  &&   arr.cells[x[0]] == " " && arr.cells[x[1]] == " "
      r = x[0]+1
      return r.to_s
  end 
     }

    WIN_COMBINATIONS.each{ |x| 
  if arr.cells[x[0]] == " " && arr.cells[x[1]] == " " && arr.cells[x[2]] == " "
      r = x[2]+1
      return r.to_s
    end 
  }
   


end


end 