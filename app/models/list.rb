class List < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :tasks, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 100 },
                   uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 500 }, allow_blank: true

  scope :with_incomplete_tasks, -> { joins(:tasks).where(tasks: { completed: false }).distinct }
  scope :with_completed_tasks, -> { joins(:tasks).where(tasks: { completed: true }).distinct }

  def percent_complete
    return 0 if tasks.empty?
    ((tasks.completed.count.to_f / tasks.count) * 100).round
  end

  def can_be_deleted?
    tasks.incomplete.empty?
  end
end
