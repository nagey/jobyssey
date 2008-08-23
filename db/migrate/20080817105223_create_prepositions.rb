class CreatePrepositions < ActiveRecord::Migration
  def self.up
    create_table :prepositions do |t|
      t.string :preposition
    end
    prepositions = 
['about', 'above', 'after','alongside', 'among', 'around', 'as', 'before', 'behind', 'beside', 'by', 'like', 'near','opposite', 'past','round', 'toward', 'with', 'ahead of', 'close to', 'far from', 'next to', 'in front of']
   
    
    prepositions.each {|p| w = Preposition.new; w.preposition = p; w.save}
  end

  def self.down
    drop_table :prepositions
  end
end
