require "open-uri"
puts "Borrando datos anteriores"

Message.delete_all
Chatroom.delete_all
Skill.delete_all
Review.delete_all
Appointment.delete_all
Handyman.delete_all
User.delete_all

puts "Creando Seeds..."

# Fabrizio_________________________
fabrizio = User.create!(
  email: 'fso@gmail.com',
  first_name: 'Fabrizio',
  last_name: 'Oyarce',
  gender: 'Male',
  age: rand(18..50),
  password: '123456'
)

file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657668271/development/photo-1547425260-76bcadfb4f2c_mg41oj.avif")

fabrizio.photo.attach(io: file, filename: "Fabrizio.jpg", content_type: "image/jpeg")

puts fabrizio.first_name

# Juli_________________________
juliana = User.create!(
  email: 'juli@gmail.com',
  first_name: 'Juliana',
  last_name: 'Juarez',
  gender: 'Female',
  age: rand(18..50),
  password: '123456'
)

file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657668332/development/photo-1580489944761-15a19d654956_ytb2p9.avif")
juliana.photo.attach(io: file, filename: "Juli.jpg", content_type: "image/jpeg")

puts juliana.first_name

# Alan_________________________
alan = User.create!(
  email: 'alan@gmail.com',
  first_name: 'Alan',
  last_name: 'Vergara',
  gender: 'Male',
  age: rand(18..50),
  password: '123456'
)

file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657668281/development/photo-1552058544-f2b08422138a_ljrx0k.avif")
alan.photo.attach(io: file, filename: "Avp.jpg", content_type: "image/jpeg")

puts alan.first_name

# Sergio_________________________
sergio = User.create!(
  email: 'sergio@gmail.com',
  first_name: 'Sergio',
  last_name: 'Sosa',
  gender: 'Male',
  age: rand(18..50),
  password: '123456'
)

file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657668304/development/photo-1500048993953-d23a436266cf_ywmp9e.avif")
sergio.photo.attach(io: file, filename: "Sergio.jpg", content_type: "image/jpeg")

puts sergio.first_name

# 1 -- JORGE --
jmunoz = User.create!(
  email: 'jmuñoz@gmail.com',
  first_name: 'Jorge',
  last_name: 'Muñoz',
  gender: 'Male',
  age: rand(18..50),
  password: '123456'
)
file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657668325/development/photo-1599566150163-29194dcaad36_abksek.avif")
jmunoz.photo.attach(io: file, filename: "jmuñoz.jpg", content_type: "image/jpeg")

puts jmunoz.first_name

# 1 -- JORGE -- HANDY --
jmunoz_h = Handyman.create!(
  description: 'I have very good disposition when it comes to work. I promise to do my best to meet expectations and will also be honest if I cant get the job done.',
  location: 'Las Condes, Santiago, Chile',
  user: jmunoz
)

# 1 -- JORGE -- SKILL --
jmunoz_skill = Skill.create!(
  name: 'Plumber',
  level: %w[Amateur Advanced Technical Professional].sample,
  description: "#{rand(1..6)} years of experience. I am very tidy and professional.",
  handyman: jmunoz_h
)

# 1 -- JORGE -- APPOINTMENT -- 1 ---
jmunoz_ap = Appointment.create!(
  date: Date.today.strftime('%B %e, %Y'),
  description: "I need a #{jmunoz_skill.name} to fix some minor issues at home",
  status: "Accepted",
  skill: jmunoz_skill.name,
  user: fabrizio,
  handyman: jmunoz_h
)

# 1 -- JORGE -- REVIEW -- 1 ---
Review.create!(
  stars: rand(4..5),
  content: "Its a good #{jmunoz_skill.name}, a professional one",
  user: fabrizio,
  appointment: jmunoz_ap,
  handyman: jmunoz_h
)

# 1 -- JORGE -- REVIEW -- 2 ---
Review.create!(
  stars: rand(4..5),
  content: "Its a grate #{jmunoz_skill.name}, everythinwent well",
  user: alan,
  appointment: jmunoz_ap,
  handyman: jmunoz_h
)

# 1 -- JORGE -- REVIEW -- 3 ---
Review.create!(
  stars: rand(1..3),
  content: "Not my favourite handyman",
  user: sergio,
  appointment: jmunoz_ap,
  handyman: jmunoz_h
)

# 2 -- FELIPE --
faraya = User.create!(
  email: 'faraya@gmail.com',
  first_name: 'Felipe',
  last_name: 'Araya',
  gender: 'Male',
  age: rand(18..50),
  password: '123456'
)
file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657668262/development/photo-1570612861542-284f4c12e75f_vyxnns.avif")
faraya.photo.attach(io: file, filename: "felipe.jpg", content_type: "image/jpeg")

puts faraya.first_name

# 2 -- FELIPE -- HANDYMAN --
faraya_h = Handyman.create!(
  description: "I can be a bit shy, but believe me, when it comes to carpentry, I'm an expert",
  location: 'Peñalolen, Santiago, Chile',
  user: faraya
)

# 2 -- FELIPE -- SKILL --
faraya_skill = Skill.create!(
  name: 'Electrician',
  level: 'Professional',
  description: "#{rand(1..6)} years of experience. I am very tidy and professional.",
  handyman: faraya_h
)

# 2 -- FELIPE -- APPOINTMENT -- 1
faraya_ap = Appointment.create!(
  date: Date.today.strftime('%B %e, %Y'),
  description: "I need a #{faraya_skill.name} to fix some minor issues at home",
  status: "Accepted",
  skill: faraya_skill.name,
  user: juliana,
  handyman: faraya_h
)

# 2 -- FELIPE -- REVIEW -- 1
Review.create!(
  stars: rand(4..5),
  content: "Its a good #{faraya_skill.name}, a professional one",
  user: juliana,
  appointment: faraya_ap,
  handyman: faraya_h
)

# 2 -- FELIPE -- REVIEW -- 2
Review.create!(
  stars: rand(4..5),
  content: "Very nice guy, I totally recommend him!",
  user: sergio,
  appointment: faraya_ap,
  handyman: faraya_h
)

# 3 -- CAMILA --
cvillalobos = User.create!(
  email: 'cvillalobos@gmail.com',
  first_name: 'Camila',
  last_name: 'Villalobos',
  gender: 'Female',
  age: rand(18..50),
  password: '123456'
)
file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657668299/development/photo-1499952127939-9bbf5af6c51c_wr1d2i.avif")
cvillalobos.photo.attach(io: file, filename: "camila.jpg", content_type: "image/jpeg")

puts cvillalobos.first_name

# 3 -- CAMILA -- HANDYMAN --
cvillalobos_h = Handyman.create!(
  description: 'When it comes to tools, I give my best',
  location: 'Ñuñoa, Santiago, Chile',
  user: cvillalobos
)

# 3 -- CAMILA -- SKILL --
cvillalobos_skill = Skill.create!(
  name: 'Electrician',
  level: %w[Amateur Advanced Technical Professional].sample,
  description: "#{rand(1..6)} years of experience. I am very tidy and professional.",
  handyman: cvillalobos_h
)

# 3 -- CAMILA -- APPOINTMENT -- 1
cvillalobos_ap = Appointment.create!(
  date: Date.today.strftime('%B %e, %Y'),
  description: "I need a #{cvillalobos_skill.name} to fix some minor issues at home",
  status: "Accepted",
  skill: cvillalobos_skill.name,
  user: alan,
  handyman: cvillalobos_h
)

# 3 -- CAMILA -- REVIEW -- 1
Review.create!(
  stars: rand(4..5),
  content: "Not only it's a good #{cvillalobos_skill.name}, she is also very funny",
  user: alan,
  appointment: cvillalobos_ap,
  handyman: cvillalobos_h
)

# 3 -- CAMILA -- REVIEW -- 2
Review.create!(
  stars: rand(4..5),
  content: "Camila was very polite and finished the job in time",
  user: fabrizio,
  appointment: cvillalobos_ap,
  handyman: cvillalobos_h
)

# 4 -- FERNANDA --
fperretta = User.create!(
  email: 'fperretta@gmail.com',
  first_name: 'Fernanda',
  last_name: 'Perretta',
  gender: 'Female',
  age: rand(18..50),
  password: '123456'
)
file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657668294/development/photo-1491349174775-aaafddd81942_hbkpan.avif")
fperretta.photo.attach(io: file, filename: "fernanda.jpg", content_type: "image/jpeg")

puts fperretta.first_name

# 4 -- FERNANDA -- HANDYMAN --
fperretta_h = Handyman.create!(
  description: "I have been using the platform for a while, and I've had only good experiences. Let's talk and see what can I do for you",
  location: 'Vitacura, Santiago, Chile',
  user: fperretta
)

# 4 -- FERNANDA -- SKILL --
fperretta_skill = Skill.create!(
  name: 'Electrician',
  level: %w[Amateur Advanced Technical Professional].sample,
  description: "#{rand(1..6)} years of experience. I am very tidy and professional.",
  handyman: fperretta_h
)

# 4 -- FERNANDA -- APPOINTMENT -- 1 --
fperretta_ap = Appointment.create!(
  date: Date.today.strftime('%B %e, %Y'),
  description: "As we discussed on the chat, I'm booking you for this saturday",
  status: "Accepted",
  skill: fperretta_skill.name,
  user: alan,
  handyman: fperretta_h
)

# 4 -- FERNANDA -- REVIEW -- 1 --
Review.create!(
  stars: rand(4..5),
  content: "She was on time and solved everything",
  user: alan,
  appointment: fperretta_ap,
  handyman: fperretta_h
)

# 4 -- FERNANDA -- REVIEW -- 2 --
Review.create!(
  stars: rand(4..5),
  content: "Its a good #{fperretta_skill.name}, a professional one",
  user: sergio,
  appointment: fperretta_ap,
  handyman: fperretta_h
)

# 5 -- FELIPE --
fpino = User.create!(
  email: 'fpino@gmail.com',
  first_name: 'Felipe',
  last_name: 'Pino',
  gender: 'Male',
  age: rand(18..50),
  password: '123456'
)

file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657668993/development/photo-1629425733761-caae3b5f2e50_cghiyw.avif")
fpino.photo.attach(io: file, filename: "felipe2.jpg", content_type: "image/jpeg")

puts fpino.first_name

# 5 -- FELIPE -- HANDYMAN --
fpino_h = Handyman.create!(
  description: 'I use this platform as an extra source of income. Please only schedule when interested',
  location: 'Las Condes, Santiago, Chile',
  user: fpino
)

# 5 -- FELIPE -- SKILL --
fpino_skill = Skill.create!(
  name: %w[Carpenter Plumber Blacksmith Electrician Gasfitter Turner Bricklayer Painter].sample,
  level: %w[Amateur Advanced Technical Professional].sample,
  description: "#{rand(1..6)} years of experience. I am very tidy and professional.",
  handyman: fpino_h
)

# 5 -- FELIPE -- APPOINTMENT -- 1 --
fpino_ap = Appointment.create!(
  date: Date.today.strftime('%B %e, %Y'),
  description: "I need some extra help to finish a job",
  status: "Accepted",
  skill: fpino_skill.name,
  user: fabrizio,
  handyman: fpino_h
)

# 5 -- FELIPE -- REVIEW -- 1 --
Review.create!(
  stars: rand(4..5),
  content: "Had an awesome time workin with him",
  user: fabrizio,
  appointment: fpino_ap,
  handyman: fpino_h
)

# 5 -- FELIPE -- REVIEW -- 2 --
Review.create!(
  stars: rand(4..5),
  content: "Its a good #{fpino_skill.name}, a professional one",
  user: juliana,
  appointment: fpino_ap,
  handyman: fpino_h
)

# 6 -- LEONARDO --
lmessa = User.create!(
  email: 'lmessa@gmail.com',
  first_name: 'Leonardo',
  last_name: 'Messa',
  gender: 'Male',
  age: rand(18..50),
  password: '123456'
)

file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657669224/development/photo-1621905252507-b35492cc74b4_unour1.avif")
lmessa.photo.attach(io: file, filename: "lmessi.jpg", content_type: "image/jpeg")

puts lmessa.first_name

# 6 -- LEONARDO -- HANDYMAN --
lmessa_h = Handyman.create!(
  description: 'for some it will be a surprise to find me here, but the truth is that I have always had these hidden talents',
  location: 'Maipu, Santiago, Chile',
  user: lmessa
)

# 6 -- LEONARDO -- SKILL -- 1
lmessa_skill = Skill.create!(
  name: 'Electrician',
  level: %w[Amateur Advanced Technical Professional].sample,
  description: "#{rand(1..6)} years of experience. I am very tidy and professional.",
  handyman: lmessa_h
)

# 6 -- LEONARDO -- SKILL -- 2
lmessa_skill = Skill.create!(
  name: 'Gasfitter',
  level: %w[Amateur Advanced Technical Professional].sample,
  description: "#{rand(1..6)} years of experience. I am very tidy and professional.",
  handyman: lmessa_h
)

# 6 -- LEONARDO -- APPOINTMENT -- 1 --
lmessa_ap = Appointment.create!(
  date: Date.today.strftime('%B %e, %Y'),
  description: "It would be grate if you could help me out",
  status: "Accepted",
  skill: lmessa_skill.name,
  user: juliana,
  handyman: lmessa_h
)

# 6 -- LEONARDO -- REVIEW -- 1 --
Review.create!(
  stars: '5',
  content: "Everything was up to my expectations",
  user: juliana,
  appointment: lmessa_ap,
  handyman: lmessa_h
)

# 6 -- LEONARDO -- REVIEW -- 2 --
Review.create!(
  stars: '5',
  content: "I'm gladd I could contact him",
  user: sergio,
  appointment: lmessa_ap,
  handyman: lmessa_h
)

# 6 -- LEONARDO -- REVIEW -- 3 --
Review.create!(
  stars: '5',
  content: "He was a very nice guy",
  user: fabrizio,
  appointment: lmessa_ap,
  handyman: lmessa_h
)

# 6 -- LEONARDO -- REVIEW -- 4 --
Review.create!(
  stars: '5',
  content: "amazing work ethics",
  user: alan,
  appointment: lmessa_ap,
  handyman: lmessa_h
)

# 7 -- ALEXIS --
asanchez = User.create!(
  email: 'asanchez@gmail.com',
  first_name: 'Alexis',
  last_name: 'Sanchez',
  gender: 'Male',
  age: rand(18..50),
  password: '123456'
)

file = URI.open("https://res.cloudinary.com/alan-v-p/image/upload/v1657669387/development/photo-1570295999919-56ceb5ecca61_o9czzh.avif")
asanchez.photo.attach(io: file, filename: "Alexis.jpg", content_type: "image/jpeg")

puts asanchez.first_name

# 7 -- ALEXIS -- HANDYMAN --
asanchez_h = Handyman.create!(
  description: 'In addition to playing soccer, manual work is very good for me',
  location: 'La Florida, Santiago, Chile',
  user: asanchez
)

# 7 -- ALEXIS -- SKILL --
asanchez_skill = Skill.create!(
  name: %w[Carpenter Plumber Blacksmith Electrician Gasfitter Turner Bricklayer Painter].sample,
  level: %w[Amateur Advanced Technical Professional].sample,
  description: "#{rand(1..6)} years of experience. I am very tidy and professional.",
  handyman: asanchez_h
)

# 7 -- ALEXIS -- APPOINTMENT -- 1 --
asanchez_ap = Appointment.create!(
  date: Date.today.strftime('%B %e, %Y'),
  description: "There is something wrong in my kitchen",
  status: "Accepted",
  skill: asanchez_skill.name,
  user: alan,
  handyman: asanchez_h
)

# 7 -- ALEXIS -- REVIEW -- 1 --
Review.create!(
  stars: rand(4..5),
  content: "Its a good #{asanchez_skill.name}, a professional one",
  user: alan,
  appointment: asanchez_ap,
  handyman: asanchez_h
)

# 7 -- ALEXIS -- REVIEW -- 2 --
Review.create!(
  stars: rand(4..5),
  content: "I'm very grateful for his help",
  user: juliana,
  appointment: asanchez_ap,
  handyman: asanchez_h
)

# 7 -- ALEXIS -- REVIEW -- 3 --
Review.create!(
  stars: rand(4..5),
  content: "Its a good #{asanchez_skill.name}, a professional one",
  user: fabrizio,
  appointment: asanchez_ap,
  handyman: asanchez_h
)

# 7 -- ALEXIS -- REVIEW -- 4 --
Review.create!(
  stars: rand(4..5),
  content: "Its a good #{asanchez_skill.name}, a professional one",
  user: sergio,
  appointment: asanchez_ap,
  handyman: asanchez_h
)
puts "finished"
