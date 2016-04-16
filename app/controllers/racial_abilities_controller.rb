###RACIAL ABILITIES

get "/races/:id/abilities/new" do
  @race = Race.find_by_id(params['id'])
  @race ? @page_name = "#{@race.name}: New Racial Ability" : redirect("/races/error")
  @racial_ability = RacialAbility.new
  erb :"racial_abilities/new"
end

post "/races/:id/abilities/new" do
  @race = Race.find_by_id(params['id'])
  @race ? @page_name = "#{@race.name}: New Racial Ability" : redirect("/races/error")
  @racial_ability = RacialAbility.new(name: params['name'],
                                      cooldown: params['cooldown'],
                                      in_game_effect: params['in_game_effect'],
                                      flavor_text: params['flavor_text'],
                                      race_id: params['id'])
  @racial_ability.save ? redirect("/races/#{@race.id}") : (erb :"racial_abilities/new")
end

get "/races/:id/abilities/error" do
  @race = Race.find_by_id(params['id'])
  @race ? @page_name = "Error: Racial Ability Not Found" : redirect("/races/error")
  erb :"racial_abilities/error"
end

get "/races/:id/abilities/:url_name" do
  @race = Race.find_by_id(params['id'])
  @racial_ability = RacialAbility.find_by(race_id: params['id'], url_name: params['url_name'])
  @race && @racial_ability ? @page_name = "#{@race.name}: #{@racial_ability.name}" : redirect("/races/#{params['id']}/abilities/error")
  erb :"racial_abilities/show"
end

get "/races/:id/abilities/:url_name/edit" do
  @race = Race.find_by_id(params['id'])
  @racial_ability = RacialAbility.find_by(race_id: params['id'], url_name: params['url_name'])
  @race && @racial_ability ? @page_name = "#{@racial_ability.name} - Edit Info" : redirect("/races/#{params['id']}/abilities/error")
  erb :"racial_abilities/edit"
end

patch "/races/:id/abilities/:url_name/edit" do
  @race = Race.find_by_id(params['id'])
  @racial_ability = RacialAbility.find_by(race_id: params['id'], url_name: params['url_name'])
  @race && @racial_ability ? @page_name = "#{@racial_ability.name} - Edit Info" : redirect("/races/#{params['id']}/abilities/error")
  @racial_ability.update_with(params) ? redirect("/races/#{@race.id}/abilities/#{@racial_ability.url_name}") : (erb :"racial_abilities/edit")
end


#binding.pry
