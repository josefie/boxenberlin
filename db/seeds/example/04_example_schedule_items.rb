
11.times do |n|
  ScheduleItem.create!([
    { label: 'Wiegen', time: Time.parse("09:00"), event_id: n },
    { label: 'Beginn', time: Time.parse("10:00"), event_id: n }
  ])
end
  