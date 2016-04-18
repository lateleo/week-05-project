###PRESTIGE CLASSES

get "/prestige_classes" do
  @page_name = "Prestige Classes Index"
  @prestige_classes = PrestigeClass.all.order(:name)
  erb :"prestige_classes/index"
end

get "/prestige_classes/new" do
  @page_name = "New Prestige Class"
  @prestige_class = PrestigeClass.new
  erb :"prestige_classes/new"
end

post "/prestige_classes/new" do
  @page_name = "New Prestige Class"
  @prestige_class = PrestigeClass.new(params)
  @prestige_class.save ? redirect("/prestige_classes") : (erb :"prestige_classes/new")
end

get "/prestige_classes/error" do
  @page_name = "Error: Prestige Class Not Found"
  erb :"prestige_classes/error"
end

get "/prestige_classes/:id" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  @prestige_class ? @page_name = "Prestige Classes: #{@prestige_class.name}" : redirect("/prestige_classes/error")
  @abilities = @prestige_class.abilities.order(:name)
  erb :"prestige_classes/show"
end

get "/prestige_classes/:id/edit" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  @prestige_class ? @page_name = "#{@prestige_class.name}: Edit Abilities" : redirect("/prestige_classes/error")
  erb :"prestige_classes/edit"
end

patch "/prestige_classes/:id/edit" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  @prestige_class ? @page_name = "#{@prestige_class.name}: Edit Abilities" : redirect("/prestige_classes/error")
  @prestige_class.update_with(params) ? redirect("/prestige_classes/#{@prestige_class.id}") : (erb :"prestige_classes/edit")
end

get "/prestige_classes/:id/add_abilities" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  @prestige_class ? @page_name = "#{@prestige_class.name}: Add Abilities" : redirect("/prestige_classes/error")
  @abilities = Ability.all.order(:name) - @prestige_class.abilities
  erb :"prestige_classes/add_abilities"
end

link "/prestige_classes/:id/add_abilities" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  @prestige_class ? @page_name = "#{@prestige_class.name}: Add Abilities" : redirect("/prestige_classes/error")
  @prestige_class.abilities += Ability.all.select{|a| params.include?(a.name)}
  redirect("/prestige_classes/#{@prestige_class.id}")
end

get "/prestige_classes/:id/remove_abilities" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  @prestige_class ? @page_name = "#{@prestige_class.name}: Remove Abilities" : redirect("/prestige_classes/error")
  @abilities = @prestige_class.abilities.order(:name)
  erb :"prestige_classes/remove_abilities"
end

unlink "/prestige_classes/:id/remove_abilities" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  @prestige_class ? @page_name = "#{@prestige_class.name}: Remove Abilities" : redirect("/prestige_classes/error")
  @prestige_class.abilities -= Ability.all.select{|a| params.include?(a.name)}
  redirect("/prestige_classes/#{@prestige_class.id}")
end

delete "/prestige_classes/:id/delete" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  @prestige_class ? @page_name = "#{@prestige_class.name}: Remove Abilities" : redirect("/prestige_classes/error")
  @prestige_class.destroy
  redirect("/prestige_classes")
end


#
