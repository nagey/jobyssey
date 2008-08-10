class PopulateBenefits < ActiveRecord::Migration
  def self.up
    a = ["Health Insurance", "Pension scheme", "Life assurance", "Dental Insurance", "Parking", "Canteen", "Subsidized canteen", "On-site childcare", "Flexible working hours", "Commuter scheme", "On-site gym", "Subsidized gym membership", "Study package or tuition reimbursement", "Subsidized professional training", "Laptop", "Mobile phone", "More than statutory holiday", "Company car", "Mileage reimbursement", "Personal office", "Bonus plan", "Professional membership support" ]

    a.each do |benefit|
    temp = Benefit.new
    temp.name = benefit
    temp.save
    end
  end

  def self.down
  end
end
