#template find and replace
# tablename = students
# classname capitalize = Student
# first variable = first_name
# second varible = last_name
# third variable = age
# code .to_i for relevant variables in initialize that are integers
#fill attr reader and attr accessor
require_relative('./house')

class Student
    attr_accessor :house_id, :age, :last_name, :first_name
    attr_reader :id
        #initialize
    def initialize( options )
        @id = options['id'].to_i if options['id']
        @house_id = options['house_id'].to_i
        @age = options['age'].to_i
        @last_name = options['last_name']
        @first_name = options['first_name']
    end
        #create
    def save()
        sql = "INSERT INTO students
        (   house_id,
            age,
            last_name,
            first_name
        )
        VALUES
        (
        $1, $2, $3, $4
        )
        RETURNING id"
        values = [  @house_id,
                    @age,
                    @last_name,
                    @first_name]
        visit = SqlRunner.run(sql, values).first
        @id = visit['id'].to_i
    end
        #read all
    def self.all()
        sql = "SELECT * FROM students"
        query = SqlRunner.run(sql,[])
        return nil if query.first == nil
        return query.map { |value| Student.new( value ) }
    end
        #find by id
    def self.find_by_id(id)
        sql = "SELECT * FROM students WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,values).first()
        return nil if query.first == nil
        return Student.new(query)
    end
        #delete all
    def self.delete_all()
        sql = "DELETE FROM students"
        SqlRunner.run(sql,[])
    end
        #delete by id
    def self.delete_by_id(id)
        sql = "DELETE FROM students WHERE id = $1"
        values = [id]
        query = SqlRunner.run(sql,values)
    end
        #update_by_id
    def self.update_by_id()
        sql = "UPDATE Student SET (house_id, age,last_name,first_name) = ($1,$2,$3,$4) WHERE id= $5"
        values = [@house_id, @age,@last_name,@first_name,@id]
        SqlRunner.run(sql,values)
    end

        #Find Student's house
    def house()
        sql = "SELECT * FROM houses WHERE id = $1"
        values = [@house_id]
        query = SqlRunner.run(sql, values).first
        return nil if query.first == nil
        return House.new(query).name
    end
end
