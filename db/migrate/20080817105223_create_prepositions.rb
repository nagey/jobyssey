class CreatePrepositions < ActiveRecord::Migration
  def self.up
    create_table :prepositions do |t|
      t.string :preposition
    end
    prepositions = ['about','above','across','after','against','along','among','around','at','before','behind','below','beneath','beside','between','beyond','by','despite','down','during','except','for','from','in','inside','into','like','near','of','off','on','onto','out','outside','over','past','since','through','throughout','till','to','toward','under','underneath','until','up','upon','with','within','without']
    prepositions.each {|p| w = Preposition.new; w.preposition = p; w.save}
  end

  def self.down
    drop_table :prepositions
  end
end
