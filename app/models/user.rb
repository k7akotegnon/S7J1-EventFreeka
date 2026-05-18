class User < ApplicationRecord
  # Un utilisateur peut participer à plusieurs événements via la table Attendance
  has_many :attendances
  has_many :events, through: :attendances

  # Un utilisateur peut administrer plusieurs événements
  # On précise 'administrator_id' car c'est le nom de la colonne dans la table events
  has_many :admin_events, foreign_key: 'administrator_id', class_name: "Event"

  # --- Validations ---
  # L'email est obligatoire, unique et doit avoir un format valide [5-7].
  validates :email, 
    presence: true, 
    uniqueness: true, 
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now # On utilise deliver_now pour envoyer l'e-mail immédiatement après la création de l'utilisateur.
  end
end
