require_relative 'question_database'

class Question
  attr_accessor :id, :title, :body, :poster_id

  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from questions
      where id = ?
    SQL
    raise "Question #{id} is not in the database" unless data

    Question.new(data.first)
  end

  def self.find_by_title(title)
    data = QuestionDatabase.instance.execute(<<-SQL, title)
      select *
      from questions
      where title = ?
    SQL
    raise "Question title #{title} is not in the database" unless data

    data.map { |question| Question.new(question) }
  end

  def self.find_posts_by_user(poster_id)
    data = QuestionDatabase.instance.execute(<<-SQL, poster_id)
      select *
      from questions
      join users on users.id = poster_id
      where poster_id = ?
    SQL
    raise "Question #{id} is not in the database" unless data

    data.map { |question| Question.new(question) }
  end

  def self.most_followed(n)
    require_relative 'question_follows.rb'
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    require_relative 'likes.rb'
    Like.most_liked_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @poster_id = options['poster_id']
  end

  def author
    require_relative 'users.rb'
    User.find_by_id(@poster_id)
  end

  def replies
    require_relative 'replies.rb'
    Reply.replies_to_question(@id)
  end

  def followers
    require_relative 'question_follows.rb'
    QuestionFollow.find_by_question_followed_id(@id)
  end

  def likers
    require_relative 'likes.rb'
    Like.likers_for_question_id(@id)
  end

  def num_likes
    require_relative 'likes.rb'
    Like.num_likes_for_question_id(@id)
  end

  def add_to_db
    QuestionDatabase.instance.execute(<<-SQL, @title, @body, @poster_id)
      insert into questions(title, body, poster_id)
      values (?, ?, ?))
    SQL
    @id = QuestionDatabase.last_insert_row_id
    "#{title} added to the database"
  end

  def update_in_db
    QuestionDatabase.instance.execute(<<-SQL, @title, @body, @poster_id, @id)
      update questions
      set title = ?,
      body = ?,
      poster_id = ?
      where id = ?
    SQL
    "question #{@id} updated with title #{title}, body #{body}"
  end

  def save
    return add_to_db unless @id

    update_in_db
  end
end


