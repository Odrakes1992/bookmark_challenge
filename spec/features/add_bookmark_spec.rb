require 'pg'

feature 'allow user to add bookmarks' do 
  scenario 'add bookmarks' do 

    visit('/addbookmarks')
    fill_in :url, with: "http://facebook.com/"
    fill_in :title, with: "Facebook"
    click_button("Submit")
    expect(page).to have_link('Facebook', href: 'http://facebook.com/')
   
  end 
end 