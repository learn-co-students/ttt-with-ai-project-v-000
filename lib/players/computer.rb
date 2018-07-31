module Players
  class Computer < Player
    # your code here

    def move(board)
      rand(1..9).to_s
    end

  end
end


#for each combo in WIN COMBinations
  #if 2 of the spaces are taken and they are the same token,
  #occupy the third space that is open
#if space 1 + 2 => go into space 3
#if space 1 + 3 => go into space 2
#if space 2 + 3 => go into space 1

  