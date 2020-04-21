class Pokemon

    attr_accessor :name, :type, :id, :db

    def initialize(name:, type:, id: nil, db: nil)
        @name = name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type) 
        VALUES (?, ?)
        SQL
        db.execute(sql, name, type)     
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon
        WHERE id = ?
        SQL
        pokemon = db.execute(sql, id).flatten
        name = pokemon[1]
        type = pokemon[2]
        new_pokemon = self.new(name: name, type: type, id: id)
        new_pokemon
    end

end
