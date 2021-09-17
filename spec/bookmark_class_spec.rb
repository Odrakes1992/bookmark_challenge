require 'bookmark'
require 'database_helpers'

describe Bookmark do 
  
  describe '.create' do 
    it 'creates a new bookmark' do 
      bookmark_number_one = Bookmark.create(url: 'http://www.example.org', title: 'Example')
      persisted_data = persisted_data(id: bookmark_number_one.id)
      
      expect(bookmark_number_one).to be_a Bookmark
      expect(bookmark_number_one.id).to eq persisted_data['id']
      expect(bookmark_number_one.title).to eq 'Example'
      expect(bookmark_number_one.url).to eq 'http://www.example.org'
     
    end
  end

  
  describe '.all' do
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      bookmark_number_one = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3 # we have entered three bookmarks above
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark_number_one.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
end
