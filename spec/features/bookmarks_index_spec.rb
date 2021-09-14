feature 'Testing for bookmarks' do 
  scenario 'show list of bookmarks' do 
    visit('/bookmarks')
    expect(page).to have_content "www.google.com"
    expect(page).to have_content "www.facebook.com"
    expect(page).to have_content "www.espn.com"
  end
end
