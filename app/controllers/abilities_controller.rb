###ABILITIES
get "/abilities" do
  @page_name = "Abilities Index"
  @abilities = Ability.all.order(:name)
  erb :"abilities/index"
end

get "/abilities/new" do
  @page_name = "New Ability"
  @ability = Ability.new
  erb :"abilities/new"
end

post "/abilities/new" do
  @page_name = "New Ability"
  @ability = Ability.new(params)
  @ability.save ? redirect("/abilities") : (erb :"abilities/new")
end

get "/abilities/error" do
  binding.pry
  @page_name = "Error: Ability Not Found"
  erb :"abilities/error"
end

get "/abilities/:id" do
  @ability = Ability.find_by_id(params['id'])
  redirect("/abilities/error") if !@ability
  @page_name = "Abilities: #{@ability.name}"
  erb :"abilities/show"
end

get "/abilities/:id/edit" do
  @ability = Ability.find_by_id(params['id'])
  redirect("/abilities/error") if !@ability
  @page_name = "#{@ability.name}: Edit Info"
  erb :"abilities/edit"
end

post "/abilities/:id/edit" do
  @ability = Ability.find_by_id(params['id'])
  redirect("/abilities/error") if !@ability
  @page_name = "#{@ability.name}: Edit Info"
  @ability.update_attributes(
                                    name: params['name'],
                                    cooldown: params['cooldown'],
                                    in_game_effect: params['in_game_effect'],
                                    flavor_text: params['flavor_text']) ? redirect("/abilities/#{@ability.id}") : (erb :"abilities/edit")
end
