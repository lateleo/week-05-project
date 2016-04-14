###RACIAL ABILITIES

get "/races/:id/abilities/new" do
  @race = Race.find_by_id(params['id'])
  redirect("/races/error") if !@race
  @page_name = "#{@race.name}: New Racial Ability"
  @racial_ability = RacialAbility.new
  erb :"racial_abilities/new"
end

post "/races/:id/abilities/new" do
  @race = Race.find_by_id(params['id'])
  redirect("/races/error") if !@race
  @page_name = "#{@race.name}: New Racial Ability"
  @racial_ability = RacialAbility.new(name: params['name'],
                                      cooldown: params['cooldown'],
                                      in_game_effect: params['in_game_effect'],
                                      flavor_text: params['flavor_text'],
                                      race_id: params['id'])
  @racial_ability.save ? redirect("/races/#{@race.id}") : (erb :"racial_abilities/new")
end

get "/races/:id/abilities/error" do
  @race = Race.find_by_id(params['id'])
  @page_name = "Error: Racial Ability Not Found"
  erb :"racial_abilities/error"
end

get "/races/:id/abilities/:url_name" do
  @race = Race.find_by_id(params['id'])
  @racial_ability = RacialAbility.find_by(race_id: params['id'], url_name: params['url_name'])
  !@race ? redirect("/races/error") : (redirect("/races/#{@race.id}/abilities/error") if !@racial_ability)
  @page_name = "#{@race.name}: #{@racial_ability.name}"
  erb :"racial_abilities/show"
end

get "/races/:id/abilities/:url_name/edit" do
  @race = Race.find_by_id(params['id'])
  @racial_ability = RacialAbility.find_by(race_id: params['id'], url_name: params['url_name'])
  !@race ? redirect("/races/error") : (redirect("/races/#{@race.id}/abilities/error") if !@racial_ability)
  @page_name = "#{@racial_ability.name} - Edit Info"
  erb :"racial_abilities/edit"
end

post "/races/:id/abilities/:url_name/edit" do
  @race = Race.find_by_id(params['id'])
  @racial_ability = RacialAbility.find_by(race_id: params['id'], url_name: params['url_name'])
  !@race ? redirect("/races/error") : (redirect("/races/#{@race.id}/abilities/error") if !@racial_ability)
  @page_name = "#{@racial_ability.name} - Edit Info"
  @racial_ability.update_attributes(
                                    name: params['name'],
                                    cooldown: params['cooldown'],
                                    in_game_effect: params['in_game_effect'],
                                    flavor_text: params['flavor_text']
    ) ? redirect("/races/#{@race.id}/abilities/#{@racial_ability.url_name}") : (erb :"racial_abilities/edit")
end


#binding.pry
