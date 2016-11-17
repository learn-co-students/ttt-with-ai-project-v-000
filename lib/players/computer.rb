class Computer < Player
  def move a
     a.cells.each_with_index do |v, i|
        if v==" " then return "#{i+1}" end
     end
  end
end