class CreateNouns < ActiveRecord::Migration
  def self.up
    create_table :nouns do |t|
      t.string :noun
    end
    nouns = ['ants','apples','','','bears','beds','bells','bikes','birds','boats','books','','brothers','cakes','cars','cats','chairs','chickens','','clocks','clouds','corn','cows','dinosaurs','dogs','dolls','ducks','eggs','eyes','feet','fish','flowers','friends','frogs','giants','grass','hands','horses','houses','kittens','legs','letters','lizards','mice','money','oranges','pets','pies','pizzas','planes','plants','rabbits','rain','rings','shoes','sisters','snails','snakes','songs','spiders','sticks','sun','teeth','things','tomatoes','toys','trains','trees','trucks','waves','wind']
    nouns.each {|n| w = Noun.new; w.noun = n; w.save }
  end

  def self.down
    drop_table :nouns
  end
end
