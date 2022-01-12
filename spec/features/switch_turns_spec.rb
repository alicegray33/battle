feature 'switch turns' do
  scenario 'switch turns' do
    sign_in_and_play
    expect(page).to have_content "#{@name1}'s turn"
    click_button 'Attack!'
    expect(page).to have_content "#{@name2}'s turn"
  end
end