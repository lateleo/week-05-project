###RACES
get "/races" do
  @page_name = "Races Index"
  @races = Race.all
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
