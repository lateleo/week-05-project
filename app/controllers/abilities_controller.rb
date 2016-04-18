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
  @page_name = "Error: Ability Not Found"
  erb :"abilities/error"
end

get "/abilities/:id" do
  @ability = Ability.find_by_id(params['id'])
  @ability ? @page_name = "Abilities: #{@ability.name}" : redirect("/abilities/error")
  erb :"abilities/show"
end

get "/abilities/:id/edit" do
  @ability = Ability.find_by_id(params['id'])
  @ability ? @page_name = "#{@ability.name}: Edit Info" : redirect("/abilities/error")
  erb :"abilities/edit"
end

patch "/abilities/:id/edit" do
  @ability = Ability.find_by_id(params['id'])
  @ability ? @page_name = "#{@ability.name}: Edit Info" : redirect("/abilities/error")
  @ability.update_with(params) ? redirect("/abilities/#{@ability.id}") : (erb :"abilities/edit")
end

delete "/abilities/:id/delete" do
  @ability = Ability.find_by_id(params['id'])
  @ability ? @page_name = "#{@ability.name}: Edit Info" : redirect("/abilities/error")
  @ability.destroy
  redirect("/abilities")
end
