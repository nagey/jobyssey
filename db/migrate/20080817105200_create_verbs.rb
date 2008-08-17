class CreateVerbs < ActiveRecord::Migration
  def self.up
    create_table :verbs do |t|
      t.string :verb
    end
    verbs = ['Builds','Buzzes','Catches','Cleans','Climbs','Composes','Crawls','Creates','Creeps','Cries','Dances','Digs','Dives','Draws','Drinks','Eats','Explores','Finds','Flies','Floats','Gallops','Glides','Glows','Goes','Grows','Hears','Hops','Jumps','Knits','Laughs','Listens','Looks','Paints','Plays','Reads','Relaxes','Rides','Runs','Screams','Screeches','Shakes','Shines','Shops','Shouts','Sings','Sits','Skips','Sleeps','Smiles','Squawks','Stalks','Stomps','Swims','Talks','Throws','Tiptoes','Travels','Views','Walks','Watches','Works','Yells']
    verbs.each {|v| w = Verb.new; w.verb = v; w.save }
  end

  def self.down
    drop_table :verbs
  end
end
