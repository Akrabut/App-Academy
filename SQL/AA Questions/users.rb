require_relative 'question_database'

class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from users
      where id = ?
    SQL
    raise "user id number #{id} is not in the database" unless data

    User.new(data.first)
  end

  def self.find_by_name(fname, lname)
    data = QuestionDatabase.instance.execute(<<-SQL, fname, lname)
      select *
      from users
      where fname like ?
      and lname like ?
    SQL
    raise "user #{fname} #{lname} is not in the database" unless data

    data.map { |user| User.new(user) }
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    require_relative 'questions.rb'
    Question.find_posts_by_user(@id)
  end

  def authored_replies
    require_relative 'replies.rb'
    Reply.replies_by_user(@id)
  end

  def followed_questions
    require_relative 'question_follows.rb'
    QuestionFollow.find_by_follower_id(@id)
  end

  def liked_questions
    require_relative 'likes.rb'
    Like.liked_questions_for_user_id(@id)
  end

  def add_to_db
    QuestionDatabase.instance.execute(<<-SQL, @fname, @lname)
      insert into users(fname, lname)
      values (?, ?)
    SQL
    @id = QuestionDatabase.last_insert_row_id
    "#{fname} #{lname} added to the database"
  end

  def update_in_db
    QuestionDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
      update users
      set fname = ?,
      lname = ?
      where id = ?
    SQL
    "user #{@id} updated with fname #{fname}, lname #{lname}"
  end

  def save
    return add_to_db unless @id

    update_in_db
  end
end

