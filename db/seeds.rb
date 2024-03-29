# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database... (Users, Coaches, Sessions, Movements, Protocol"
User.destroy_all

puts "Users cleaned"
puts " "
puts " "

Coach.destroy_all
puts "Coaches cleaned"
puts " "
puts " "

Movement.destroy_all
puts "Movements cleaned"
puts " "
puts " "

# Protocol.destroy_all
# puts "Protocols cleaned"
# puts " "
# puts " "

Training.destroy_all
puts "Trainings cleaned"
puts " "
puts " "

puts "Creating 10 users..."
saved_users = []

mayeul = User.new(first_name:"Mayeul", last_name:"Pons",
sex:"Male", weight:72, height:175, age:23, objectives:"endurance", rating:5, email:"contact@myminicom.com", password:"123456")
louise = User.new(first_name:"Louise", last_name:"Tabouret",
sex:"Male", weight:63, height:173, age:30, objectives:"muscles", rating:4, email:"contac@myminicom.com", password:"123456")
loulou = User.new(first_name:"Louise", last_name:"LaGuerne",
sex:"Male", weight:62, height:172, age:27, objectives:"breath", rating:3, email:"conta@myminicom.com", password:"123456")
lea = User.new(first_name:"Lea", last_name:"Ravaux",
sex:"Male", weight:58, height:170, age:23, objectives:"muscles", rating:5, email:"cont@myminicom.com", password:"123456")
manu = User.new(first_name:"Emmanuel", last_name:"Madarassou",
sex:"Male", weight:66, height:170, age:25, objectives:"endurance", rating:4, email:"con@myminicom.com", password:"123456")
julie = User.new(first_name:"Julie", last_name:"Paume",
sex:"Male", weight:58, height:168, age:24, objectives:"breath", rating:3, email:"co@myminicom.com", password:"123456")
ancolie = User.new(first_name:"Ancolie", last_name:"Landa",
sex:"Male", weight:56, height:170, age:32, objectives:"endurance", rating:4, email:"c@myminicom.com", password:"123456")
willem = User.new(first_name:"Willem", last_name:"Lacour",
sex:"Male", weight:69, height:171, age:36, objectives:"muscles", rating:2, email:"redaction@myminicom.com", password:"123456")
hicham = User.new(first_name:"Hicham", last_name:"DeLacour",
sex:"Male", weight:66, height:174, age:35, objectives:"weight", rating:2, email:"redactio@myminicom.com", password:"123456")
corentin = User.new(first_name:"Corentin", last_name:"Bironneau",
sex:"Male", weight:71, height:175, age:25, objectives:"weight", rating:5, email:"redacti@myminicom.com", password:"123456")

users = [mayeul, louise, loulou, lea, manu, julie, ancolie, willem, hicham, corentin]
users.each do |user|
  user.save!
  saved_users << user
  puts "User ID n°#{user.id} - #{user.first_name} has been created"
end

puts "#{saved_users.length} users have been created!"
puts " "
puts " "

puts "Creating 4 coaches..."
saved_coaches = []

quentin = Coach.new(first_name:"Quentin", last_name:"Louvel", graduation:"Coach school", sports:"crossfit", age:25, location:"12 rue Alexandre Dumas, 75020 Paris", rating: 5, email:"raphael@myminicom.com", password:"123456")
raphael = Coach.new(first_name:"Raphael", last_name:"Kalinowski", graduation:"Paris Coach school", sports:"English boxing", age:31, location:"114 Boulevard de Charonne, 75020 Paris", rating: 3, email:"raphae@myminicom.com", password:"123456")
stephanie = Coach.new(first_name:"Stephanie", last_name:"Nogues", graduation:"Charonne Coach school", sports:"Dance", age:36, location:"114 Boulevard de Charonne, 75020 Paris", rating: 4, email:"rapha@myminicom.com", password:"123456")
clement = Coach.new(first_name:"Clement", last_name:"Gourdin", graduation:"Neoness school", sports:"MMA", age:35, location:"23 rue Hénard, 75012 Paris", rating: 2, email:"raph@myminicom.com", password:"123456")

coaches = [quentin, raphael, stephanie, clement]

coaches.each do |coach|
  coach.save!
  saved_coaches << coach
  puts "User ID n°#{coach.id} - #{coach.first_name} has been created"
end

puts "#{saved_coaches.length} coaches have been created!"
puts " "
puts " "

puts "Creating 4 movements..."

saved_movements = []

lift_up = Movement.new(name:"Lift up", description:"Move your arm from bottom to top", rest_time: 15)
push_up = Movement.new(name:"Push up", description:"Lying on the ground and push your body with your arms top to bottom", rest_time: 30)
squat = Movement.new(name:"Squat", description:"Put one leg a front of you one leg behind and push your body with your legs bottom to top", rest_time: 15)
burpee = Movement.new(name:"Burpee", description:"Lying on the ground, push with your arms to lift up your body and stand up then jump ones", rest_time: 60)

created_movements = [lift_up, push_up, squat, burpee]

created_movements.each do |movement|
  movement.save!
  saved_movements << movement
  puts "User ID n°#{movement.id} - #{movement.name} has been created"
end

puts "#{saved_movements.length} movements have been created!"
puts " "
puts " "

puts "Creating 7 trainings..."

saved_trainings = []
training_quentin_manu = Training.new(title:"Training session: #{quentin.first_name} x #{manu.first_name}", objectives:"#{manu.first_name} - #{manu.objectives}", location: "134 Boulevard de Charonne, 75020 Paris", duration: 90, results:"3 rep de 20 x #{lift_up.name} & 5 rep de 10 x #{squat.name}", coach_id: quentin.id, user_id: manu.id, movements: [lift_up.id, squat.id], date: '2021-10-23')
training_quentin_lea = Training.new(title:"Training session: #{quentin.first_name} x #{lea.first_name}", objectives:"#{lea.first_name} - #{lea.objectives}", location: "34 Boulevard de Charonne, 75020 Paris", duration: 60, results:"5 rep de 10 x #{push_up.name} & 3 rep de 10 x #{burpee.name}", coach_id: quentin.id, user_id: lea.id, movements: [push_up.id, burpee.id], date: '2021-09-12')
training_quentin_lea_new = Training.new(title:"Training session: #{quentin.first_name} x #{lea.first_name}", objectives:"#{lea.first_name} - #{lea.objectives}", location: "22 Boulevard de Charonne, 75011 Paris", duration: 30, results:"4 rep de 20 x #{lift_up.name} & 3 rep de 10 x #{burpee.name}", coach_id: quentin.id, user_id: lea.id, movements: [lift_up.id, burpee.id], date: '2021-08-20')
training_raphael_mayeul = Training.new(title:"Training session: #{raphael.first_name} x #{mayeul.first_name}", objectives:"Training: #{quentin.first_name} x #{mayeul.first_name} - #{mayeul.objectives}", location: "198 Boulevard de la Villette, 75019 Paris", duration: 120, results:"5 rep de 20 x #{squat.name} & 8 rep de 12 x #{lift_up.name} & 5 rep de 15 x #{burpee.name}", coach_id: raphael.id, user_id: mayeul.id, movements: [squat.id, lift_up.id, burpee.id], date: '2021-04-13')
training_stephanie_loulou = Training.new(title:"Training session: #{stephanie.first_name} x #{loulou.first_name}", objectives:"#{loulou.first_name} - #{loulou.objectives}", location:"134 Boulevard de Charonne, 75020 Paris", duration: 90, results:"3 rep de 20 x #{lift_up.name} & 5 rep de 10 x #{squat.name}", coach_id: stephanie.id, user_id: loulou.id, movements: [lift_up.id, squat.id], date: '2021-10-13')
training_clement_julie = Training.new(title:"Training session: #{clement.first_name} x #{julie.first_name}", objectives:"#{julie.first_name} - #{julie.objectives}", location:"14 rue Voltaire, 75011 Paris", duration: 30, results:"3 rep de 20 x #{push_up.name} & 5 rep de 10 x #{squat.name}", coach_id: clement.id, user_id: julie.id, movements: [push_up.id, squat.id], date: '2021-02-23')
training_raphael_lea = Training.new(title:"Training session: #{raphael.first_name} x #{lea.first_name}", objectives:"#{lea.first_name} - #{lea.objectives}", location:"87 rue Voltaire, 75020 Paris", duration: 60, results:"3 rep de 20 x #{push_up.name} & 5 rep de 10 x #{squat.name}", coach_id: raphael.id, user_id: lea.id, movements: [push_up.id, squat.id], date: '2021-01-12')

trainings = [training_quentin_manu, training_quentin_lea, training_raphael_mayeul, training_stephanie_loulou, training_clement_julie, training_quentin_lea_new, training_raphael_lea]

trainings.each do |training|
  training.save!
  saved_trainings << training
  puts "User ID n°#{training.id} - #{training.title} has been created"
end

puts "#{saved_trainings.length} Trainings have been created!"
puts " "
puts " "
