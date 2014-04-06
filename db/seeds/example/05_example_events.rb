@events = Event.create!([
  
  # Beispielveranstaltungen
  { title: 'Boxveranstaltung', date: Date.parse("2014-01-25"), club_id: 2, approved: true, contact_mail: @clubs[1].contact_mail},
  { title: 'Boxveranstaltung', date: Date.parse("2014-02-02"), club_id: 3, approved: true, contact_mail: @clubs[2].contact_mail},
  { title: 'BL in Herzberg', date: Date.parse("2014-02-14"), club_id: 4, approved: true, contact_mail: @clubs[3].contact_mail},
  { title: 'BL in Berlin', date: Date.parse("2014-02-22"), club_id: 4, approved: true, contact_mail: @clubs[3].contact_mail},
  { title: 'Gesundbrunnenturnier', date: Date.parse("2014-03-01"), club_id: 4, approved: true, contact_mail: @clubs[3].contact_mail, :boxers => @boxers},
  { title: 'Gesundbrunnenturnier', date: Date.parse("2014-03-02"), club_id: 4, approved: true, contact_mail: @clubs[3].contact_mail},
  { title: 'Gesundbrunnenturnier', date: Date.parse("2014-03-08"), club_id: 5, approved: true, contact_mail: @clubs[4].contact_mail},
  { title: 'Gesundbrunnenturnier', date: Date.parse("2014-03-09"), club_id: 5, approved: true, contact_mail: @clubs[4].contact_mail},
  { title: 'Landesmeisterschaft U17/U19', date: Date.parse("2014-03-21"), club_id: 1, approved: true, contact_mail: @clubs[0].contact_mail},
  { title: 'Boxen International', date: Date.parse("2014-04-08"), club_id: 1, approved: true, contact_mail: @clubs[0].contact_mail},
  { title: 'Landesmeisterschaft U13/U15', date: Date.parse("2014-04-11"), club_id: 1, approved: true, contact_mail: @clubs[0].contact_mail}

  ])
  