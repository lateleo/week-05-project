###CHARACTERS

###characters
get "/characters" do
  @page_name = "Characters Index"
  @characters = Character.all.order(:name)
  erb :"characters/index"
end

get "/characters/new" do
  @page_name = "New Character"
  @character = Character.new
  @base_classes = BaseClass.all.order(:name)
  @races = Race.all.order(:name)
  erb :"characters/new"
end

post "/characters/new" do
  @page_name = "New Character"
  @character = Character.new(params)
  @base_classes = BaseClass.all.order(:name)
  @races = Race.all.order(:name)
  @character.save ? redirect("/characters") : (erb :"characters/new")
end

get "/characters/error" do
  @page_name = "Error: Character Not Found"
  erb :"characters/error"
end

get "/characters/:id" do
  @character = Character.find_by_id(params['id'])
  @character ? @page_name = "Characters: #{@character.name}" : redirect("/characters/error")
  erb :"characters/show"
end

get "/characters/:id/edit" do
  @character = Character.find_by_id(params['id'])
  @base_classes = BaseClass.all.order(:name)
  @races = Race.all.order(:name)
  @character ? @page_name = "#{@character.name}: Edit Info" : redirect("/characters/error")
  erb :"characters/edit"
end

post "/characters/:id/edit" do
  @character = Character.find_by_id(params['id'])
  @character ? @page_name = "#{@character.name}: Edit Info" : redirect("/characters/error")
  @base_classes = BaseClass.all.order(:name)
  @races = Race.all.order(:name)

  @character.update_with(params) ? redirect("/characters/#{@character.id}") : (erb :"characters/edit")
end
