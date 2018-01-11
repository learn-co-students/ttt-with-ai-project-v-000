# config/initializers/monkey_patches.rb

# THESE METHODS WILL BE AVAILABLE TO ALL OBJECTS
Object.class_eval do 
#===================================================
  def self.my_im
    self.instance_methods.sort-Object.instance_methods
  end
  
  def self.my_cm
    self.singleton_methods.sort
  end
#===================================================
end



