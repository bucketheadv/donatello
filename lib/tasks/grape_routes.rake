desc "API routes"
namespace :grape do
  task routes: :environment do
    Route = Struct.new(:verb, :path)
    routes = [Route.new("Verb", "URI Pattern")]
    API::RootAPI.routes.each do |route|
      routes << Route.new(route.request_method, route.path)
    end
    max_verb_size = routes.max_by{|r| r.verb.size}.verb.size
    max_path_size = routes.max_by{|r| r.path.size}.path.size
    routes.each do |route|
      puts "       #{route.verb.ljust(max_verb_size)} #{route.path.ljust(max_path_size)}"
    end
  end
end
