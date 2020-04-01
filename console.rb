require( 'pry-byebug' )

require_relative('models/house')
require_relative('models/student')

House.delete_all()
Student.delete_all()

house1 = House.new({'name' =>'Gryffindor' , 'logo' => 'URL1'})
house1.save

house2 = House.new({'name' =>'Ravenclaw' , 'logo' => 'URL2'})
house2.save

house3 = House.new({'name' =>'Hufflepuff' , 'logo' => 'URL3'})
house3.save

house4 = House.new({'name' =>'Slytherin' , 'logo' => 'URL4'})
house4.save

student1 = Student.new({'first_name' => 'Harry', 'last_name' => 'Potter', 'age' => '12', 'house_id' => house1.id})
student1.save()

student2 = Student.new({'first_name' => 'Hermoine', 'last_name' => 'Granger', 'age' => '12', 'house_id' => house1.id})
student2.save()

student3 = Student.new({'first_name' => 'Draco', 'last_name' => 'Malvoy', 'age' => '12', 'house_id' => house4.id})
student3.save()

student4 = Student.new({'first_name' => 'Cedric', 'last_name' => 'Diggory', 'age' => '12', 'house_id' => house3.id})
student4.save()

student5 = Student.new({'first_name' => 'Cho', 'last_name' => 'Chang', 'age' => '12', 'house_id' => house2.id})
student5.save()



binding.pry
nil
