require 'rubygems'
require 'sinatra'
require 'json'

get '/' do
  redirect '/index.html'
end

# Success.
post '/posts' do
  JSON.generate({ :id => 1, :title => 'Foo amended', :body => '...', :foo => 'bar' })
end

put '/posts/:id' do
  JSON.generate({ :id => 1, :title => 'Bar amended', :body => '...' })
end

delete '/posts/:id' do
end

# Blank response (Rails' `head :ok`)
put '/posts-empty-response/:id' do
  ' '
end

# Failure.
post '/posts-failure' do
  status 500
end

put '/posts-failure/:id' do
  status 500
end

delete '/posts-failure/:id' do
  status 500
end

# Validations.
post '/posts-validations' do
  status 422
  JSON.generate({
    :title => ['should not be "Foo"', 'should be "Bar"']
  })
end

put '/posts-validations/:id' do
  status 422
  JSON.generate({
    :title => ['should not be "Foo"', 'should be "Bar"']
  })
end

delete '/posts-validations/:id' do
  status 422
  JSON.generate({
    :title => ['must do something else before deleting']
  })
end
