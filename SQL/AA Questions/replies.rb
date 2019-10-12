require_relative 'question_database'

class Reply
  attr_accessor :id, :question_answered_id, :parent_reply_id, :writer_id, :body

  def self.all
    data = QuestionDatabase.instance.execute(<<-SQL)
      select *
      from replies
    SQL

    data.map { |reply| Reply.new(reply) }
  end

  def self.find_by_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from replies
      where id = ?
    SQL
    raise "Reply #{id} is not in the database" unless data

    Reply.new(data.first)
  end

  def self.find_by_question_answered_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from replies
      where question_answered_id = ?
    SQL
    raise "Reply #{id} is not in the database" unless data

    data.map { |reply| Reply.new(reply) }
  end

  def self.replies_by_user(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from replies
      join users on writer_id = users.id
      where writer_id = ?
    SQL
    raise "No replies by user #{id}" unless data

    data.map { |reply| Reply.new(reply) }
  end

  def self.replies_to_question(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from replies
      join questions on question_answered_id = questions.id
      where question_answered_id = ?
    SQL
    raise "No replies by to question #{id}" unless data

    data.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @question_answered_id = options['question_answered_id']
    @parent_reply_id = options['parent_reply_id']
    @writer_id = options['writer_id']
    @body = options['body']
  end

  def author
    QuestionDatabase.instance.execute(<<-SQL, @writer_id, @id)
      select writer_id
      from replies
      where writer_id = ?
      and id = ?
    SQL
  end

  def question
    QuestionDatabase.instance.execute(<<-SQL, @question_answered_id, @id)
      select question_answered_id
      from replies
      where question_answered_id = ?
      and id = ?
    SQL
  end

  def parent_reply
    data = QuestionDatabase.instance.execute(<<-SQL, @id)
      select parent_reply_id
      from replies
      where id = ?
    SQL
    raise "no parent reply for reply #{id}" unless data

    data
  end

  def child_replies
    data = QuestionDatabase.instance.execute(<<-SQL, @id)
      select *
      from replies
      where parent_reply_id = ?
    SQL
    raise "no child replies for reply #{id}" unless data

    data
  end
end

