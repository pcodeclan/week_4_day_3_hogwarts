require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('./models/student')
require_relative('./models/house')
also_reload('./models/*')

# INDEX
get '/hogwarts' do
  @students = Student.all()
  # @house = @student.house()
	#@house = House.all(@student.house_id)
	erb(:index)
end

#NEW
get '/hogwarts/new' do
  # @students = Student.all()
  @houses = House.all()
  erb(:new)
end

#CREATE
post '/hogwarts' do
	# p params.to_s
  new_student = Student.new(params)
  new_student.save()
  redirect('/hogwarts')
end
