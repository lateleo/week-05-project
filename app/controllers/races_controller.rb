###RACES
get "/races" do
  @page_name = "Races Index"
  @races = Race.all.order(:name)
  erb :"races/index"
end

get "/races/new" do
  @page_name = "New Race"
  @race = Race.new
  erb :"races/new"
end

post "/races/new" do
  @page_name = "New Race"
  @race = Race.new(params)
  @race.save ? redirect("/races") : (erb :"races/new")
end

get "/races/:id" do
  @race = Race.find_by_id(params['id'])
  @page_name = "Races: #{@race ? @race.name : "Error"}"
  @racial_abilities = RacialAbility.where(race_id: params['id'])
  erb :"races/show"
end

get "/races/:id/edit" do
  @race = Race.find_by_id(params['id'])
  @page_name = @race ? "#{@race.name}: Edit Info" : "Error"
  erb :"races/edit"
end

post "/races/:id/edit" do
  @race = Race.find_by_id(params['id'])
  @page_name = @race ? "#{@race.name}: Edit Info" : "Error"
  @race.update_attributes(name: params['name'],
                          age_of_adulthood: params['age_of_adulthood'],
                          stamina_index: params['stamina_index'],
                          strength_index: params['strength_index'],
                          agility_index: params['agility_index'],
                          spell_power_index: params['spell_power_index'],
                          wit_index: params['wit_index'],
                          flavor_text: params['flavor_text']) ?
  redirect("/races/#{@race.id}") : (erb :"races/edit")
end



#binding.pry
