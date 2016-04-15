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
  redirect("/prestige_classes/error") if !@prestige_class
  @page_name = "Prestige Classes: #{@prestige_class.name}"
  @abilities = @prestige_class.abilities.order(:name)
  erb :"prestige_classes/show"
end

get "/prestige_classes/:id/edit" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  redirect("/prestige_classes/error") if !@prestige_class
  @page_name = "#{@prestige_class}: Edit Info"
  erb :"prestige_classes/edit"
end

post "/prestige_classes/:id/edit" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  redirect("/prestige_classes/error") if !@prestige_class
  @page_name = "#{@prestige_class}: Edit Info"
  @prestige_class.update_attributes(
                                name: params['name'],
                                role: params['role'],
                                armor_type: params['armor_type'],
                                entry_requirements: params['entry_requirements'],
                                stamina_index: params['stamina_index'],
                                strength_index: params['strength_index'],
                                agility_index: params['agility_index'],
                                spell_power_index: params['spell_power_index'],
                                wit_index: params['wit_index'],
                                flavor_text: params['flavor_text']
    ) ? redirect("/prestige_classes/#{@prestige_class.id}") : (erb :"prestige_classes/edit")
end

get "/prestige_classes/:id/edit_abilities" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  redirect("/prestige_classes/error") if !@prestige_class
  @page_name = "#{@prestige_class}: Edit Abilities"
  @abilities = Ability.all.order(:name)
  erb :"prestige_classes/edit_abilities"
end

post "/prestige_classes/:id/edit_abilities" do
  @prestige_class = PrestigeClass.find_by_id(params['id'])
  redirect("/prestige_classes/error") if !@prestige_class
  @page_name = "#{@prestige_class}: Edit Abilities"
  @abilities = Ability.all.order(:name)
  @prestige_class.abilities.clear
  @abilities.all? {|ability| @prestige_class.abilities << ability if ability.name == params[ability.name]} ?
    redirect("/prestige_classes/#{@prestige_class.id}") : (erb :"prestige_classes/edit_abilities")
end
