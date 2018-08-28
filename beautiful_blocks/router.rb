class Router
  def initialize(&block)
    instance_eval &block
    # yield self
  end

  def match(route)
    puts route
  end
end

routes = Router.new do
  match '/about' => 'home#about'
  match '/users' => 'users#index'
end
