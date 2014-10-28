require "addressable/uri"
require "rest-client"

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s

  puts RestClient.post(
    url,
    { user: { name: "Gizma", email: "gizmo@gizmo.gizmo" } }
  )
end

# create_user

def show_user(ind)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{ind}"
  ).to_s

  puts RestClient.get(url)
end

# show_user(1)

def update_user(ind)
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{ind}"
  ).to_s

  puts RestClient.put(
    url,
    { user: { name: "CJ", email: "cj@compsci.edu" } }
  )
end

# update_user(1)

def delete_user(ind)
  
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: "/users/#{ind}"
  ).to_s

  puts RestClient.delete(url)
  
end

delete_user(3)