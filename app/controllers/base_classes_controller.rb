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
  @base_class ? @page_name = "Base Classes: #{@base_class.name}" : redirect("/base_classes/error")
  @abilities = @base_class.abilities.order(:name)
  erb :"base_classes/show"
end

get "/base_classes/:id/edit" do
  @base_class = BaseClass.find_by_id(params['id'])
  @base_class ? @page_name = "#{@base_class.name}: Edit Info" : redirect("/base_classes/error")
  erb :"base_classes/edit"
end

patch "/base_classes/:id/edit" do
  @base_class = BaseClass.find_by_id(params['id'])
  @base_class ? @page_name = "#{@base_class.name}: Edit Info" : redirect("/base_classes/error")
  @base_class.update_with(params) ? redirect("/base_classes/#{@base_class.id}") : (erb :"base_classes/edit")
end

get "/base_classes/:id/add_abilities" do
  @base_class = BaseClass.find_by_id(params['id'])
  @base_class ? @page_name = "#{@base_class.name}: Edit Abilities" : redirect("/base_classes/error")
  @abilities = Ability.all.order(:name) - @base_class.abilities
  erb :"base_classes/add_abilities"
end

link "/base_classes/:id/add_abilities" do
  @base_class = BaseClass.find_by_id(params['id'])
  @base_class ? @page_name = "#{@base_class.name}: Edit Abilities" : redirect("/base_classes/error")
  @base_class.abilities += Ability.all.select{|a| params.include?(a.name)}
  redirect("/base_classes/#{@base_class.id}")
end

get "/base_classes/:id/remove_abilities" do
  @base_class = BaseClass.find_by_id(params['id'])
  @base_class ? @page_name = "#{@base_class.name}: Remove Abilities" : redirect("/base_classes/error")
  @abilities = @base_class.abilities.order(:name)
  erb :"base_classes/remove_abilities"
end

unlink "/base_classes/:id/remove_abilities" do
  @base_class = BaseClass.find_by_id(params['id'])
  @base_class ? @page_name = "#{@base_class.name}: Remove Abilities" : redirect("/base_classes/error")
  @base_class.abilities -= Ability.all.select{|a| params.include?(a.name)}
  redirect("/base_classes/#{@base_class.id}")
end

delete "/base_classes/:id/delete" do
  @base_class = BaseClass.find_by_id(params['id'])
  @base_class ? @page_name = "#{@base_class.name}: Remove Abilities" : redirect("/base_classes/error")
  @base_class.destroy
  redirect("/base_classes")
end

#binding.pry
