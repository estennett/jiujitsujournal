module ApplicationHelper

# NHO: First helper method I have seen from a student, excellent use here!
  def embed(video_url)
    youtube_id = video_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

end
