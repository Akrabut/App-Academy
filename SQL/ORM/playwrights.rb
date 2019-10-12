require 'sqlite3'
require 'singleton'

class PlaywrightDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year

  def self.all
    data = PlaywrightDBConnection.instance.execute('SELECT * FROM playwrights')
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    data = PlaywrightDBConnection.instance.execute(<<-SQL, name)
      select *
      from playwrights
      where name like ?
    SQL

    Playwright.new(data.first)
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} is already in the database" if @id

    PlaywrightDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      insert into playwrights(name, birth_year)
      values (?, ?)
    SQL
    @id = PlaywrightDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} is not in the database" unless @id

    PlaywrightDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      update playwrights
      set name = ?, birth_year = ?
      where id = ?
    SQL
  end

  def get_plays
    raise "#{self} is not in the database" unless @id

    PlaywrightDBConnection.instance.execute(<<-SQL, @id)
      select *
      from playwrights
      join plays on playwrights.id = playwright_id
      where playwright_id = ?
    SQL
  end
end
