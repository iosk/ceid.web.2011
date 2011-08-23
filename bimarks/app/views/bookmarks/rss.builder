xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "bimarks"
    xml.link        url_for :only_path => false, :controller => 'bookmarks' 
    xml.description "biMarks, because even the bookmarks can be bi."

    for bookmark in @bookmarks
      xml.item do
        xml.title bookmark.title
        xml.description bookmark.q_review
xml.pubDate bookmark.created_at.to_s(:rfc822)
        xml.link bookmark_url(bookmark)
        xml.guid bookmark_url(bookmark)
      end
    end
  end
end
