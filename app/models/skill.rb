class Skill < Metric
  
  def name=(name)
    self.display_name = name
    self.method_missing 'name=', name.downcase
  end
  
end
