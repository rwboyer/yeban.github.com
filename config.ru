require 'rack'
require 'rack/contrib/try_static'

use Rack::TryStatic, 
    :root => "_site",  # static files root dir
    :urls => %w[/],     # match all requests 
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

app = lambda do |env|
  [ 404, {'Content-Type' => 'text/html'}, File.readlines('_site/404.html') ]
end

run Rack::TryStatic.new(app, :root => '_site', :urls => %w[/], :try => %w[.html index.html /index.html])
