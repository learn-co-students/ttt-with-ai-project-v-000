class Human < Player


  def move(board)
    gets.chomp
  end

  def token=(token)
    @token = token
  end


end