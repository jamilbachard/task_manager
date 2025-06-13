class Task < ApplicationRecord
  belongs_to :list

  validates :title, presence: true, length: { minimum: 3, maximum: 100 },
                   uniqueness: { case_sensitive: false, scope: :list_id }
  validates :description, length: { maximum: 500 }, allow_blank: true
  validates :position, presence: true

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
  scope :ordered, -> { order(position: :asc) }

  before_validation :set_position, on: :create
  before_save :normalize_title

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
