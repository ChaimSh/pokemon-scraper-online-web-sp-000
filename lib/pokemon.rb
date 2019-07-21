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
  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

end
