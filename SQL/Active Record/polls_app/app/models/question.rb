class Question < ApplicationRecord
  validates :body, presence: true, length: {minimum:10, maximum:1000}

  belongs_to :poll,
    class_name: :Poll,
    foreign_key: :poll_id,
    primary_key: :id
  has_many :answer_choices,
    class_name: :AnswerChoice,
    foreign_key: :question_id,
    primary_key: :id
  has_many :responses,
    through: :answer_choices, 
    source: :responses

  def results
    
    # answer_choices.includes(:responses).each_with_object(Hash.new(0)) do |choice, hash|
    #   hash[choice.body] += choice.responses.length
    # end
  end
end
