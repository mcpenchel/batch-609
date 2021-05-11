# This is where you can create initial data for your app.
require 'date'

# Consultation.delete_all # this skips ActiveRecord validations
Consultation.destroy_all # this does not
Patient.destroy_all
Intern.destroy_all
Doctor.destroy_all

tex = Doctor.create!(
  first_name: "Thiago",
  last_name: "Teixeira",
  specialty: "Neurologist"
)

alia = Doctor.create!(
  first_name: "Alia",
  last_name: "Penchel",
  specialty: "Pediatric Surgery"
)

# Associate the id explicitly
carla = Intern.create!(
  first_name: "Carla",
  last_name: "Valdivia",
  doctor_id: tex.id
)

# Associate the id implicitly
# Prefer this one!
luca = Intern.create!(
  first_name: "Luca",
  last_name: "Severo",
  doctor: tex
)

joao = Intern.new(first_name: "João Marcos", last_name: "Sampaio")
joao.doctor = alia
joao.save!

pedro = Patient.create!(
  first_name: "Pedro",
  last_name: "Barbosa"
)

andre = Patient.create!(
  first_name: "Marcos André",
  last_name: "Menezes"
)

Consultation.create!(
  date: Date.today,
  patient: andre,
  doctor: tex
)

Consultation.create!(
  date: Date.today,
  patient: pedro,
  doctor: tex
)