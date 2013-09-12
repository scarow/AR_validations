get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  
  erb :create_event
end

post '/events/create' do
  event = Event.new(organizer_name: params[:organizer_name], organizer_email: params[:organizer_email], title: params[:title], date: params[:date])

  if event.save
    redirect "/events/#{event.id}/show"
  else
    @signup_errors = event.errors.messages
    erb :create_event
  end
end
