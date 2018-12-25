class Paper < ActiveRecord::Base
  attr_accessible :subject_id
  has_many :questions
  has_many :tests
  belongs_to :subject
end