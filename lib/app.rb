require "./lib/where_is_terence/terence"

class WhereIsTerence < Sinatra::Base
  set :method_override, true
  set :root, "lib/app"

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    terence = Terence.new
    erb :index, locals: { terence: terence }
  end
end
