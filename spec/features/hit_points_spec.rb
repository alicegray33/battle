feature 'Hit points' do
  let(:damage){ 5 }

  scenario 'see both player hitpoints' do
    sign_in_and_play
    expect(page).to have_content "#{@name1}: #{Player::DEFAULT_HITPOINTS}HP"
    expect(page).to have_content "#{@name2}: #{Player::DEFAULT_HITPOINTS}HP"
  end

  scenario 'player 1 attacks player 2 and gets confirmation' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).to have_content "#{@name1} attacked #{@name2} for #{damage} damage!"
  end

  scenario 'expect to see hitpoints reduced by 20' do
    sign_in_and_play
    click_button 'Attack!'
    expect(page).not_to have_content "#{@name2}: #{Player::DEFAULT_HITPOINTS}HP"
    expect(page).to have_content "#{@name2}: #{Player::DEFAULT_HITPOINTS - Game::ATTACK_DAMAGE}HP"
    
  end
  scenario 'second attack reduces other players hitpoints' do
    sign_in_and_play
    click_button 'Attack!'
    click_button 'Attack!'
    expect(page).to have_content "#{@name1}: #{Player::DEFAULT_HITPOINTS - Game::ATTACK_DAMAGE}HP"
  end
  scenario 'it declares a winner and loser when a player reaches 0HP' do
    sign_in_and_play
    19.times { $game.attack($game.player_1) }
    click_button 'Attack!'
    expect(page).to have_content "#{@name2} defeats #{@name1}!"
  end
end