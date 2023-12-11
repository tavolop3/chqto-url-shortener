# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
User.create!([
               { email: 'juancho@gmail.com', username: 'juancho', password: 'contra' },
               { email: 'pepe@gmail.com', username: 'pepito', password: 'contra' },
               { email: 'tavo@gmail.com', username: 'tavo', password: 'contra' }
             ])

Link.create!([
               { url: 'https://www.google.com', name: 'Google', user_id: 1 },
               { url: 'https://www.youtube.com', name: 'Youtube', user_id: 1 },
               { url: 'https://www.facebook.com', name: 'Facebook', user_id: 2 },
               { url: 'https://www.twitter.com', name: 'Twitter', user_id: 2 },
               { url: 'https://www.instagram.com', name: 'Instagram', user_id: 3 }
             ])

Access.create!([
                 # Accesos para el primer link (Google)
                 { link_id: 1, ip_address: '181.92.178.72', created_at: DateTime.now.utc },
                 { link_id: 1, ip_address: '236.27.43.153', created_at: DateTime.new(2023, 12, 5, 12, 30, 0).utc },
                 { link_id: 1, ip_address: '123.45.67.89', created_at: DateTime.new(2023, 12, 5, 15, 45, 0).utc },
                 { link_id: 1, ip_address: '181.92.178.72', created_at: DateTime.now.utc - 10.days },
                 { link_id: 1, ip_address: '181.92.178.72', created_at: DateTime.now.utc - 10.days },
                 { link_id: 1, ip_address: '236.27.43.153', created_at: DateTime.now.utc - 9.days },
                 { link_id: 1, ip_address: '123.45.67.89', created_at: DateTime.now.utc - 8.days },
                 { link_id: 1, ip_address: '192.168.0.1', created_at: DateTime.now.utc - 7.days },
                 { link_id: 1, ip_address: '55.77.99.110', created_at: DateTime.now.utc - 6.days },
                 { link_id: 1, ip_address: '55.77.99.110', created_at: DateTime.now.utc - 6.days },
                 { link_id: 1, ip_address: '203.45.67.91', created_at: DateTime.now.utc - 5.days },
                 { link_id: 1, ip_address: '77.99.111.120', created_at: DateTime.now.utc - 4.days },
                 { link_id: 1, ip_address: '86.44.128.200', created_at: DateTime.now.utc - 3.days },
                 { link_id: 1, ip_address: '97.209.157.188', created_at: DateTime.now.utc - 2.days },
                 { link_id: 1, ip_address: '128.45.67.90', created_at: DateTime.now.utc - 1.day },

                 # Accesos para el segundo link (Youtube)
                 { link_id: 2, ip_address: '97.209.157.188', created_at: DateTime.new(2023, 12, 3, 12, 30, 0).utc },
                 { link_id: 2, ip_address: '86.44.128.200', created_at: DateTime.new(2023, 11, 30, 7, 4, 0).utc },
                 { link_id: 2, ip_address: '192.168.1.1', created_at: DateTime.new(2023, 11, 30, 8, 15, 0).utc },

                 # Accesos para el tercer link (Facebook)
                 { link_id: 3, ip_address: '128.45.67.90', created_at: DateTime.new(2023, 12, 5, 9, 0, 0).utc },
                 { link_id: 3, ip_address: '77.88.99.100', created_at: DateTime.new(2023, 12, 5, 14, 30, 0).utc },
                 { link_id: 3, ip_address: '55.66.77.88', created_at: DateTime.new(2023, 12, 5, 18, 45, 0).utc },

                 # Accesos para el cuarto link (Twitter)
                 { link_id: 4, ip_address: '192.168.2.1', created_at: DateTime.new(2023, 12, 4, 10, 0, 0).utc },
                 { link_id: 4, ip_address: '203.45.67.91', created_at: DateTime.new(2023, 12, 4, 14, 15, 0).utc },

                 # Accesos para el quinto link (Instagram)
                 { link_id: 5, ip_address: '55.77.99.110', created_at: DateTime.new(2023, 12, 4, 8, 30, 0).utc },
                 { link_id: 5, ip_address: '77.99.111.120', created_at: DateTime.new(2023, 12, 4, 16, 45, 0).utc }
               ])

require 'faker'
fecha_inicio = DateTime.new(2023, 12, 1, 0, 0, 0).utc
fecha_fin = DateTime.new(2023, 12, 31, 23, 59, 59).utc
1000.times do
  Access.create!(link: Link.all.sample, ip_address: Faker::Internet.ip_v4_address,
                 created_at: rand(fecha_inicio..fecha_fin))
end

25.times do
  link = Link.create!(url: Faker::Internet.url, name: Faker::Commerce.brand, user: User.all.sample)
  rand(50).times do
    Access.create!(link:, ip_address: Faker::Internet.ip_v4_address)
  end
end
