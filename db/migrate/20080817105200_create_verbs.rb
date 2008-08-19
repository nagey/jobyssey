class CreateVerbs < ActiveRecord::Migration
  def self.up
    create_table :verbs do |t|
      t.string :verb
    end
    verbs = ['Walks', 'Dances', 'Sings', 'Hops', 'Runs', 'Skips', 'Moves', 'Swims', 'Yells', 'Talks', 'Whispers', 'Travels', 'Composes', 'Crawls', 'Dives', 'Draws', 'Explores', 'Flies', 'Floats', 'Gallops', 'Glides', 'Goes', 'Jumps', 'Laughs', 'Listens', 'Paints', 'Reads',  'Rides', 'Shakes', 'Shouts', 'Sits', 'Sleeps', 'Smiles', 'Watches', 'Works', 'Soars']
    verbs.each {|v| w = Verb.new; w.verb = v; w.save }
  end

  def self.down
    drop_table :verbs
  end
end
