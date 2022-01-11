feature 'View hit points' do

  scenario 'see player 2 hitpoints' do
    sign_in_and_play
    # save_and_open_page
    expect(page).to have_content "Julie: 60HP"
  end

  scenario 'attack player 2 and get confirmation' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).to have_content "You attacked Julie"
  end
end