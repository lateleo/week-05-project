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

get "/races/error" do
  @page_name = "Error: Race Not Found"
  erb :"races/error"
end

get "/races/:id" do
  @race = Race.find_by_id(params['id'])
  redirect("/races/error") if !@race
  @page_name = "Races: #{@race.name}"
  @racial_abilities = RacialAbility.where(race_id: params['id'])
  erb :"races/show"
end

get "/races/:id/edit" do
  @race = Race.find_by_id(params['id'])
  redirect("/races/error") if !@race
  @page_name = "#{@race.name}: Edit Info"
  erb :"races/edit"
end

post "/races/:id/edit" do
  @race = Race.find_by_id(params['id'])
  redirect("/races/error") if !@race
  @page_name = "#{@race.name}: Edit Info"
  @race.update_attributes(
                          name: params['name'],
                          age_of_adulthood: params['age_of_adulthood'],
                          stamina_index: params['stamina_index'],
                          strength_index: params['strength_index'],
                          agility_index: params['agility_index'],
                          spell_power_index: params['spell_power_index'],
                          wit_index: params['wit_index'],
                          flavor_text: params['flavor_text']
    ) ? redirect("/races/#{@race.id}") : (erb :"races/edit")
end



#binding.pry
