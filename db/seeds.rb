# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin = User.find_or_create_by(email: 'admin@example.com') do |user|
    user.password = 'password123'
    user.role = 'admin'
  end
  
puts "Usuario administrador creado con correo: #{admin.email}"

usuario = User.find_or_create_by(email: 'usuario@example.com') do |user|
  user.password = 'password123'
  user.role = 'user'
end

puts "Usuario normal creado con correo: #{usuario.email}"

usuario01 = User.find_or_create_by(email: 'usuario01@example.com') do |user|
  user.password = 'password123'
  user.role = 'user'
end

puts "Usuario normal creado con correo: #{usuario01.email}"

# Crear publicaciones
publicacion = Post.find_or_create_by(titulo: 'Publicacion 1') do |post|
  post.descripcion = 'Oferta Laboral 01'
  post.user_id = admin.id
end