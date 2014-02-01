# ruby encoding: utf-8

  @boxers_1 = Array.new
  50.times do |n|
    @boxers_1 << Boxer.create!({
      first_name: 'Boxer',
      last_name: n+1,
      date_of_birth: rand((Date.today-25.year)..(Date.today-10.year)),
      weight: rand(30.0..90.0),
      gender: [true, false].sample,
      fights_won: rand(0..15),
      fights_lost: rand(0..10),
      fights_drawn: rand(0..5),
      club_id: 4
    })
  end
  
=begin
  @boxers_2 = Array.new
  30.times do |n|
    @boxers_2 << Boxer.create!({
      first_name: 'Boxer',
      last_name: n+1,
      date_of_birth: rand((Date.today-37.year)..(Date.today-10.year)),
      weight: rand(30..100),
      gender: [true, false].sample,
      fights_won: rand(0..15),
      fights_lost: rand(0..10),
      fights_drawn: rand(0..5),
      club_id: rand(1..5)
    })
  end
  
  @boxers_3 = Array.new
  40.times do |n|
    @boxers_3 << Boxer.create!({
      first_name: 'Boxer',
      last_name: n+1,
      date_of_birth: rand((Date.today-25.year)..(Date.today-10.year)),
      weight: rand(40..90),
      gender: [true, false].sample,
      fights_won: rand(0..15),
      fights_lost: rand(0..10),
      fights_drawn: rand(0..5),
      club_id: rand(1..5)
    })
  end
  
=end