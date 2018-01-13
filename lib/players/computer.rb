module Players
#======================AI======================
  class Joshua < Player
    def move(board)
      sleep(0.3)
      puts "AI is thinking...".red
      pos = board.cells.each_with_index.find{|c, i| c == " "}
      (pos[1]+1).to_s
    end
  end
#===================WARGAMES===================
  class Joshua_War < Player
    def move(board)
      sleep(0.1)
      puts "I AM NO MATCH FOR MYSELF!...\n".red
      pos = board.cells.each_with_index.find{|c, i| c == " "}
      (pos[1]+1).to_s
    end
  end
#==============================================
end