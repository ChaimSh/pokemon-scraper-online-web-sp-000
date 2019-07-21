class Pokemon

attr_accessor :id, :name, :type, :db


  def initialize(keywords)
    #  @id = id
    #  @name = name
    #  @type = type
    #  @db = db
   end

   def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
   end

  #  def self.find(id, db)
  #    sql = <<-SQL
  #       SELECT * FROM pokemon WHERE id = (?);
  #     SQL
  #     pokemon = db.execute(sql, [id]).flatten
  #     Pokemon.new(id:, name:, type:, db:)
  #   end
  def self.find(id, db)
  pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
  Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

end
