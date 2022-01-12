feature 'Enter names' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Start new game'
  end
  scenario 'Allows players to enter their name' do
    sign_in_and_play
    
    expect(page).to have_content "#{@name1} vs #{@name2}"
    
  end
end