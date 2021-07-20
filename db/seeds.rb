### Clear all Data
User.destroy_all

### Create Users
10.times do |i|
  User.create(email: "test_#{i}@example.com", password: '12345678')
end
