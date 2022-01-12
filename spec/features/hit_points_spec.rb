feature 'View hit points' do

  scenario 'see player 2 hitpoints' do
    sign_in_and_play
    # save_and_open_page
    expect(page).to have_content "#{@name2}: #{Player::DEFAULT_HITPOINTS}HP"
  end

  scenario 'attack player 2 and get confirmation' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).to have_content "You attacked #{@name2}"
  end

  scenario 'expect to see hitpoints reduced by 20' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).not_to have_content "#{@name2}: #{Player::DEFAULT_HITPOINTS}HP"
    expect(page).to have_content "#{@name2}: #{Player::DEFAULT_HITPOINTS - Player::ATTACK_DAMAGE}HP"
    
  end
end