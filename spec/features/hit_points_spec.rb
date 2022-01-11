feature 'View hit points' do

  scenario 'see player 2 hitpoints' do
    visit('/')
    fill_in :player_1_name, with: 'John'
    fill_in :player_2_name, with: 'Julie'
    click_button 'Go!'

    expect(page).to have_content 'Julie: 60HP'
  end
end