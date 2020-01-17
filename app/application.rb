class Application
 
  # @@songs = [Song.new("Sorry", "Justin Bieber"),
  #           Song.new("Hello","Adele")]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match
    @@songs.each do |song|
      resp.write "#{song.title}\n"
    end
 
    resp.finish
  end
end