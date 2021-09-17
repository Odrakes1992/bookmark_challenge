require 'pg'

feature 'allow user to add bookmarks' do 
  scenario 'add bookmarks' do 

    visit('/addbookmarks')
    fill_in :url, with: "http://facebook.com/"
    click_button("Submit")
    expect(page).to have_content "http://facebook.com/"
  end 
end 