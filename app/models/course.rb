class Course < ActiveRecord::Base
  validates :name, presence: true

  has_many :enrollments
  has_many :students, through: :enrollments

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [
        :name,
        [:name, :id]
    ]
  end
end
