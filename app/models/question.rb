class Question < ActiveRecord::Base
  attr_accessible :firstOption, :fourthOption, :secondOption, :subject_id, :thirdOption, :title, :answer
  belongs_to :subject

  has_many :papers

  validates :title, presence: true, length: { maximum: 100 } 
  validates :firstOption, presence: true 
  validates :secondOption, presence: true
  validates :thirdOption, presence: true 
  validates :fourthOption, presence: true 
  validates :subject_id, presence: true 
  validates :answer, presence: true
end
