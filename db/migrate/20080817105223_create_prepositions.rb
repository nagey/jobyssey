class CreatePrepositions < ActiveRecord::Migration
  def self.up
    create_table :prepositions do |t|
      t.string :preposition
    end
    prepositions = ['above','across','after','along','among','around','at','before','behind','below','beneath','beside','between','beyond','near','over','toward','under','underneath','with']
    prepositions.each {|p| w = Preposition.new; w.preposition = p; w.save}
  end

  def self.down
    drop_table :prepositions
  end
end
