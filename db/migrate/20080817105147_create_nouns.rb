class CreateNouns < ActiveRecord::Migration
  def self.up
    create_table :nouns do |t|
      t.string :noun
    end
    nouns = ['Ants', 'Bears', 'Birds', 'Ducks', 'Fish', 'Horses', 'Rabbits', 'Spiders', 'Trees', 'Waves', 'Wind',  'Clouds', 'Mountains', 'Rivers', 'Buffaloes', 'Eagles', 'Owls', 'Hawks', 'Falcons', 'Forests', 'Trout', 'Oceans',  'Canoes', 'Wolves', 'Elephants', 'Hills', 'Lakes', 'Bulls', 'Cats', 'Seals', 'Sea Lions', 'Turtles', 'Giraffes', 'Lions', 'Tigers', 'Pumas', 'Jaguars', 'Zebras', 'Dolphins', 'Orcas', 'Starfish', 'Gazelle', 'Deer', 'Penguins', 'Pelicans', 'Swordfish']
    nouns.each {|n| w = Noun.new; w.noun = n; w.save }
  end

  def self.down
    drop_table :nouns
  end
end
