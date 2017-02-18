class Application
 @@items = [Item.new("a",1),Item.new("b",2)]
  def call(env)
    resp=Rack::Response.new
    req=Rack::Request.new(env)
    if req.path.match(/items/)
      item_name=req.path.split("/items/").last
      if extant=@@items.find {|item| item.name==item_name}
        resp.write "#{extant.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
     resp.finish
  end
end
