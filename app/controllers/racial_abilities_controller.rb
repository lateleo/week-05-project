###RACIAL ABILITIES

get "/races/:id/abilities/new" do
  @race = Race.find_by_id(params['id'])
  @page_name = @race ? "#{@race.name}: New Racial Ability" : "Error"
  @racial_ability = RacialAbility.new
  erb :"races/new_ability"
end

post "/races/:id/abilities/new" do
  @race = Race.find_by_id(params['id'])
  @page_name = @race ? "#{@race.name}: New Racial Ability" : "Error"
  @racial_ability = RacialAbility.new(name: params['name'],
                                      cooldown: params['cooldown'],
                                      in_game_effect: params['in_game_effect'],
                                      flavor_text: params['flavor_text'],
                                      race_id: params['id'])
  @racial_ability.save ? redirect("/races/#{@race.id}") : (erb :"races/new_ability")
end

get "/races/:id/abilities/:url_name" do
  @race = Race.find_by_id(params['id'])
  @racial_ability = RacialAbility.find_by(race_id: params['id'], url_name: params['url_name'])
  @page_name = (@race && @racial_ability) ? "#{@race.name}: #{@racial_ability.name}" : "Error"
  erb :"races/show_ability"
end

get "/races/:id/abilities/:url_name/edit" do
  @race = Race.find_by_id(params['id'])
  @racial_ability = RacialAbility.find_by(race_id: params['id'], url_name: params['url_name'])
  @page_name = (@race && @racial_ability) ? "#{@racial_ability.name} - Edit Info" : "Error"
  erb :"races/edit_ability"
end

post "/races/:id/abilities/:url_name/edit" do
  @race = Race.find_by_id(params['id'])
  @racial_ability = RacialAbility.find_by(race_id: params['id'], url_name: params['url_name'])
  @page_name = (@race && @racial_ability) ? "#{@racial_ability.name} - Edit Info" : "Error"
  @racial_ability.update_attributes(name: params['name'],
                                    cooldown: params['cooldown'],
                                    in_game_effect: params['in_game_effect'],
                                    flavor_text: params['flavor_text']) ?
  redirect("/races/#{@race.id}/abilities/#{@racial_ability.url_name}") : (erb :"races/edit_ability")
end


#binding.pry
