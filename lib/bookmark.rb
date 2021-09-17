require 'pg'

class Bookmark 

  def self.create(url:)
    if ENV['ENVIRONMENT'] = 'test' 
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    #url is the variable passed through it would be the v in k=>v pairing
  end


  def self.all
   
    if ENV['ENVIRONMENT'] = 'test' 
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map {|bookmark| bookmark['url']}
   
  end
end