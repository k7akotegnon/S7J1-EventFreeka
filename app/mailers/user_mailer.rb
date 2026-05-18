class UserMailer < ApplicationMailer
  default from: 'no-reply@event-freeka.fr'

  def welcome_email(user)
    # On récupère l'instance user pour la passer à la view
    @user = user 

    # On définit l'url à afficher dans l'e-mail
    @url  = 'http://event-freeka.fr/login' 

    # C'est cet appel à mail() qui déclenche l'envoi
    mail(to: @user.email, subject: 'Bienvenue sur EventFreeka !')
  end

  def attendance_email(attendance)
    # On récupère l'instance de la participation
    @attendance = attendance
    # On récupère l'administrateur de l'événement lié à cette participation
    @admin = @attendance.event.administrator

    # On définit l'url de l'événement pour le lien dans le mail
    @url  = "http://event-freeka.fr/events/#{@attendance.event.id}" 

    # On envoie l'e-mail à l'administrateur
    mail(to: @admin.email, subject: 'Nouveau participant à votre événement !')
  end
end
