class Application
 
  @@items = [Item.new("foodA",9.99)]
 
  def call(env)
   resp, req = Rack::Response.new, Rack::Request.new(env)
    unless req.path.match(/items/)
      # not Found
      resp.status = 404
      resp.write("Route not found")
    else
      # Found
      query = req.path.split("/items/").last
      found_item = @@items.find{|item| item.name == query}
      if found_item
        resp.status = 200
        resp.write(item.price)
      else 
        resp.status = 400
        resp.write("Item not found")
      end
    end
    resp.finish
  end
end