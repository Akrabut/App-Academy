class AnswerChoice < ApplicationRecord
  validates :body, presence: true, length: {minimum: 5, maximum: 500}

  belongs_to :question,
    class_name: :Question,
    foreign_key: :question_id,
    primary_key: :id

  has_many :responses,
    class_name: :Response,
    foreign_key: :answer_choice_id,
    primary_key: :id
end
