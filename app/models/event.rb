class Event < ApplicationRecord
  # Indique que l'administrateur est un User
  belongs_to :administrator, class_name: "User"
  
  # Tes autres associations (has_many, etc.) viendront ensuite
  # Un événement a plusieurs participations et plusieurs participants (users)
  has_many :attendances
  has_many :users, through: :attendances

  # Validations
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past # Validation personnalisée

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :duration_is_multiple_of_five # Validation personnalisée

  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, in: 1..1000 }
  validates :location, presence: true

  private

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Time.now
      errors.add(:start_date, "ne peut pas être dans le passé")
    end
  end

  def duration_is_multiple_of_five
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "doit être un multiple de 5")
    end
  end

end
