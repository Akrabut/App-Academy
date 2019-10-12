class Response < ApplicationRecord
  validate :respondent_already_answered?
  validate :did_i_write_this?

  belongs_to :respondent,
    class_name: :User,
    foreign_key: :respondent_id,
    primary_key: :id
  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    foreign_key: :answer_choice_id,
    primary_key: :id
  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(id: id)
  end

  def respondent_already_answered?
    flag = sibling_responses.any? { |answer| answer.respondent_id == respondent_id }
    errors[:respondent_id] << 'cant respond to the same question twice' if flag
  end

  def did_i_write_this?
    flag = question.poll.author.id == respondent_id
    errors[:respondent_id] << 'cant rig your own poll dude' if flag
  end
end
