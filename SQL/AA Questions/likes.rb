require_relative 'question_database'

class Like
  attr_accessor :id, :liker_id, :question_liked_id

  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from question_likes
      where id = ?
    SQL
    raise "Like #{id} is not in the database" unless data

    Like.new(data.first)
  end

  def self.find_likes_by_user_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from question_likes
      join users on liker_id = users.id
      where liker_id = ?
    SQL
    raise "Likes by user #{id} are not in the database" unless data

    data.map { |like| Like.new(like) }
  end

  def self.find_likes_for_question(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from question_likes
      join questions on question_liked_id = questions.id
      where question_liked_id = ?
    SQL
    raise "No likes for question #{id}" unless data

    data.map { |like| Like.new(like) }
  end

  def self.likers_for_question_id(question_id)
    QuestionDatabase.instance.execute(<<-SQL, question_id)
      select users.id, fname, lname
      from users
      join question_likes on users.id = liker_id
      where question_liked_id = ?
    SQL
  end

  def self.num_likes_for_question_id(question_id)
    QuestionDatabase.instance.execute(<<-SQL, question_id)
      select count(liker_id) as likes
      from question_likes
      where question_liked_id = ?
    SQL
  end

  def self.liked_questions_for_user_id(user_id)
    QuestionDatabase.instance.execute(<<-SQL, user_id)
      select users.id, questions.id, questions.title
      from users
      join question_likes on users.id = liker_id
      join questions on questions.id = question_liked_id
      where liker_id = ?
    SQL
  end

  def self.most_liked_questions(n)
    QuestionDatabase.instance.execute(<<-SQL, n)
      select questions.id, questions.title, count(liker_id) as likes
      from questions
      join question_likes on questions.id = question_liked_id
      group by questions.id
      order by likes desc
      limit ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @liker_id = options['liker_id']
    @question_liked_id = options['question_liked_id']
  end
end
