class Employee < User
    belongs_to :employer
    has_one :administrator, :class_name => "Employee"
  
end
