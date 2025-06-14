class Task < ApplicationRecord
  belongs_to :list

  enum :priority, {
    low: 0,
    medium: 1,
    high: 2
  }

  validates :title, presence: true, length: { minimum: 3, maximum: 100 },
                   uniqueness: { case_sensitive: false, scope: :list_id }
  validates :description, length: { maximum: 500 }, allow_blank: true
  validates :position, presence: true
  validates :priority, presence: true

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
  scope :ordered, -> { order(position: :asc) }
  scope :by_priority, ->(priority) { where(priority: priority) if priority.present? }
  scope :ordered_by_priority, -> { order(priority: :desc, position: :asc) }

  before_validation :set_position, on: :create
  before_save :normalize_title

  def user_id
    list.user_id
  end

  private

  def set_position
    return if position.present?
    max_position = list.tasks.maximum(:position) || 0
    self.position = max_position + 1
  end

  def normalize_title
    self.title = title.strip.titleize if title.present?
  end
end
