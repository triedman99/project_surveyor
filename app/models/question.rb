class Question < ApplicationRecord
  belongs_to :survey

  has_many :options, :dependent => :destroy
  has_many :answers

  accepts_nested_attributes_for :options, :reject_if => :all_blank, :allow_destroy => true

  def multiple_choice?
    self.question_type = 'multiple'
  end

  def select_multiple?
    self.multi_select
  end
end
