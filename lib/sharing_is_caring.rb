module SharingIsCaring

   def input_to_index(user_input)
    user_input.to_i - 1
  end

  # def valid_move?(i)
  #   num = input_to_index(i)
  #   i = i.to_s
  #   i.between(0, 8) && !(taken(num))
  # end

end