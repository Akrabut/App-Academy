require_relative 'question_database'

class QuestionFollow
  attr_accessor :follower_id, :question_followed_id

  def initialize(hash)
    @user_id = hash['follower_id']
    @question_id = hash['question_followed_id']
  end

  def self.all
    data = QuestionDatabase.instance.execute(<<-SQL)
      select *
      from question_follows
      join users on follower_id = users.id
      join questions on question_followed_id = questions.id
    SQL

    data.map { |ele| QuestionFollow.new(ele) }
  end

  def self.find_by_follower_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from question_follows
      join users on follower_id = users.id
      join questions on question_followed_id = questions.id
      where follower_id = ?
    SQL
    data.map { |ele| QuestionFollow.new(ele) }
  end

  def self.find_by_question_followed_id(id)
    data = QuestionDatabase.instance.execute(<<-SQL, id)
      select *
      from question_follows
      join users on follower_id = users.id
      join questions on question_followed_id = questions.id
      where question_followed_id = ?
    SQL
    data.map { |ele| QuestionFollow.new(ele) }
  end

  def self.most_followed_questions(n)
    QuestionDatabase.instance.execute(<<-SQL, n)
      select question_followed_id, count(question_followed_id)
      from question_follows
      join users on follower_id = users.id
      join questions on question_followed_id = questions.id
      group by question_followed_id
      order by count(question_followed_id) desc
      limit ?
    SQL
  end
end

p QuestionFollow.all
#p QuestionFollow.most_followed_questions(2)