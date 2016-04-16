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
  @race ? @page_name = "Races: #{@race.name}" : redirect("/races/error")
  @racial_abilities = RacialAbility.where(race_id: params['id'])
  erb :"races/show"
end

get "/races/:id/edit" do
  @race = Race.find_by_id(params['id'])
  @race ? @page_name = "#{@race.name}: Edit Info" : redirect("/races/error")
  erb :"races/edit"
end

patch "/races/:id/edit" do
  @race = Race.find_by_id(params['id'])
  @race ? @page_name = "#{@race.name}: Edit Info" : redirect("/races/error")
  @race.update_with(params) ? redirect("/races/#{@race.id}") : (erb :"races/edit")
end



#binding.pry
