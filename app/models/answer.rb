class Answer < ApplicationRecord
  belongs_to :option
  belongs_to :question
  belongs_to :survey

  validates :question_id, :presence => true
  validates :option_id, :presence => true
end
