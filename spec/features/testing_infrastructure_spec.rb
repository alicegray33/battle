feature 'Testing infrastructure working!' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Start new game'
  end
  scenario 'Allows players to enter their name' do
    visit('/')
    fill_in :player_1_name, with: 'John'
    fill_in :player_2_name, with: 'Julie'
    click_button 'Go!'

    # save_and_open_page

    expect(page).to have_content 'John vs Julie'
    
  end
end