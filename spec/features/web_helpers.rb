def sign_in_and_play
  # @name1 = "John"
  # @name2 = "Julie"
  visit('/')
  fill_in :player_1_name, with: 'John'
  fill_in :player_2_name, with: 'Julie'
  click_button 'Go!'
end