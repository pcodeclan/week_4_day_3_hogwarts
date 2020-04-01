require_relative('../db/sqlrunner.rb')
#template find and replace
# tablename = houses
# classname capitalize = House
# first variable = name
# second varible = logo
# code .to_i for relevant variables in initialize that are integers
#fill attr reader and attr accessor
class House
    attr_accessor
    attr_reader :id, :logo, :name
        #initialize
    def initialize( options )
        @id = options['id'].to_i if options['id']
        @logo = options['logo']
        @name = options['name']
    end
        #create
    def save()
        sql = "INSERT INTO houses
        (
            logo,
            name
        )
        VALUES
        (
        $1, $2
        )
        RETURNING id"
        values =   [@logo, @name]
        visit = SqlRunner.run(sql, values).first
        @id = visit['id'].to_i
    end
        #read all
    def self.all()
        sql = "SELECT * FROM houses"
        query = SqlRunner.run(sql,[])
        return nil if query.first == nil
        return query.map { |value| House.new( value ) }
    end
        #find by id
    def self.find_by_id(id)
        sql = "SELECT * FROM houses WHERE id = $1"
        values = [@id]
        query = SqlRunner.run(sql,values)
        return nil if query.first == nil
        return House.new(query)
    end
        #delete all
    def self.delete_all()
        sql = "DELETE FROM houses"
        SqlRunner.run(sql,[])
    end
        #delete by id
    def self.delete_by_id(id)
        sql = "DELETE * FROM houses WHERE id = $1"
        values = [@id]
        query = SqlRunner.run(sql,values)
    end
        #update_by_id
    def self.update_by_id()
        sql = "UPDATE House SET (logo,name) = ($1,$2) WHERE id= $3"
        values = [@logo, @name, @id]
        SqlRunner.run(sql,values)
    end
end
