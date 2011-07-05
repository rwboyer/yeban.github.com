require 'rack'
require 'rack/contrib/try_static'

use Rack::TryStatic, 
    :root => "_site",  # static files root dir
    :urls => %w[/],     # match all requests 
    :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

app = lambda do |env|
    [ 200, {'Content-Type' => 'text/html'}, ['Not Found!'] ]
end

run app
