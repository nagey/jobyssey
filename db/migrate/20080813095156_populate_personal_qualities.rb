class PopulatePersonalQualities < ActiveRecord::Migration
  def self.up

    a = [
    { 'name' => "Scope of Interest", 'lower_bound' => "Mainly focuses on the details of a project", 'upper_bound' => "Mainly focuses on the big picture"}, 
    { 'name' => "Preparation approach", 'lower_bound' => "Enjoys the planning phase of a new project most", 'upper_bound' =>"Enjoys the execution phase of a new project most"}, 
    { 'name' => "Problem solving approach", 'lower_bound' => "Tends to approach problems analytically", 'upper_bound' =>"Tends to approach problems intuitively"}, 
    { 'name' => "Measure of success", 'lower_bound' => "Focuses mainly on the process", 'upper_bound' =>"Focuses mainly on the product"},
    { 'name' => "Level of risk", 'lower_bound' => "Prefers a high degree of certainty before acting", 'upper_bound' =>"Prefers to take greater risks"},
    { 'name' => "Focus", 'lower_bound' => "Likes to focus on one thing at a time", 'upper_bound' =>"Likes to multitask"}, 
    { 'name' => "Perfectionism and Realism", 'lower_bound' => "Would rather perfect one thing before moving on", 'upper_bound' =>"Would rather make some progress, albeit imperfect, on a number of things"},
    { 'name' => "Time with others",'lower_bound' =>  "Likes to spend more time working independently", 'upper_bound' =>"Likes to spend more time working collaboratively"},
    { 'name' => "Type of team", 'lower_bound' => "Works best with a team of people with similar skills and responsibilities", 'upper_bound' =>"Works best with a team of varying specialities and duties"},
    { 'name' => "Oversight", 'lower_bound' => "Most productive when working closely with the boss", 'upper_bound' =>"Most productive with general direction from the boss but pretty autonomous"},
    { 'name' => "Client interaction", 'lower_bound' => "Likes to work very closely with clients (internal or external)", 'upper_bound' =>"Likes to have someone else handle most of the client communication"}, 
    { 'name' => "Assertiveness", 'lower_bound' => "Has an assertive personality at work", 'upper_bound' =>"More laid back and easy going at the office"},

    {'name'=>"Structure", 'lower_bound' => "Prefers a clear chain of command and well-defined relationships with my colleagues", 'upper_bound' =>"Prefers a looser, more informal structure at the office"}, 

    { 'name' => "Dynamics", 'lower_bound' => "Thrives in an ever evolving environment", 'upper_bound' =>"Prefers a more stable and familiar workplace"},
    { 'name' => "Company size", 'lower_bound' => "Likes small companies", 'upper_bound' =>"Likes big companies"}, 
    { 'name' => "Intensity", 'lower_bound' => "Works best in a more pressurized environment", 'upper_bound' =>"Works best in a less pressurized environment"},
    { 'name' => "Formality", 'lower_bound' => "Prefers a more traditional professional office culture",  'upper_bound' =>"Prefers a more casual and informal office culture"},
    { 'name' => "Socializing", 'lower_bound' => "Prefers a company with lots of socializing outside of hours", 'upper_bound' =>"Prefers a company where attendance at after-work events is not a must"}, 
    { 'name' => "Office style", 'lower_bound' => "Prefers open plan offices", 'upper_bound' =>"Prefers individual offices"},
    { 'name' => "Overtime", 'lower_bound' => "Likes an office where people work as late as need be to finish a task", 'upper_bound' =>"Likes an office where it's OK to leave at closing time"}
    ]
    
    a.each do |thehash|
        metric = Trait.new thehash
        metric.save
    end
      
  end

  def self.down
  end
end
