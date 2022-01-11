feature 'View hit points' do

  scenario 'see player 2 hitpoints' do
    sign_in_and_play
    expect(page).to have_content "#{@name2}: 60HP"
  end
end