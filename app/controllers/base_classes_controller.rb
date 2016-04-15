###BASE CLASSES

get "/base_classes" do
  @page_name = "Base Classes Index"
  @base_classes = BaseClass.all.order(:name)
  erb :"base_classes/index"
end

get "/base_classes/new" do
  @page_name = "New Base Class"
  @base_class = BaseClass.new
  erb :"base_classes/new"
end

post "/base_classes/new" do
  @page_name = "New Base Class"
  @base_class = BaseClass.new(params)
  @base_class.save ? redirect("/base_classes") : (erb :"base_classes/new")
end

get "/base_classes/error" do
  @page_name = "Error: Base Class Not Found"
  erb :"base_classes/error"
end

get "/base_classes/:id" do
  @base_class = BaseClass.find_by_id(params['id'])
  redirect("/base_classes/error") if !@base_class
  @page_name = "Base Classes: #{@base_class.name}"
  @abilities = @base_class.abilities.order(:name)
  erb :"base_classes/show"
end

get "/base_classes/:id/edit" do
  @base_class = BaseClass.find_by_id(params['id'])
  redirect("/base_classes/error") if !@base_class
  @page_name = "#{@base_class}: Edit Info"
  erb :"base_classes/edit"
end

post "/base_classes/:id/edit" do
  @base_class = BaseClass.find_by_id(params['id'])
  redirect("/base_classes/error") if !@base_class
  @page_name = "#{@base_class}: Edit Info"
  @base_class.update_attributes(
                                name: params['name'],
                                role: params['role'],
                                armor_type: params['armor_type'],
                                stamina_index: params['stamina_index'],
                                strength_index: params['strength_index'],
                                agility_index: params['agility_index'],
                                spell_power_index: params['spell_power_index'],
                                wit_index: params['wit_index'],
                                flavor_text: params['flavor_text']
    ) ? redirect("/base_classes/#{@base_class.id}") : (erb :"base_classes/edit")
end

get "/base_classes/:id/edit_abilities" do
  @base_class = BaseClass.find_by_id(params['id'])
  redirect("/base_classes/error") if !@base_class
  @page_name = "#{@base_class}: Edit Abilities"
  @abilities = Ability.all.order(:name)
  erb :"base_classes/edit_abilities"
end

post "/base_classes/:id/edit_abilities" do
  @base_class = BaseClass.find_by_id(params['id'])
  redirect("/base_classes/error") if !@base_class
  @page_name = "#{@base_class}: Edit Abilities"
  @abilities = Ability.all.order(:name)
  @base_class.abilities.clear
  @abilities.all? {|ability| @base_class.abilities << ability if ability.name == params[ability.name]} ?
    redirect("/base_classes/#{@base_class.id}") : (erb :"base_classes/edit_abilities")
end

#binding.pry
