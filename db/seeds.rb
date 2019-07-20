Flat.create(name: "Apt 26b", flat_key: rand(36**30).to_s(36), address_one: "Apartment 26 b", address_two: "Marylebone", city: "London", postcode: "W2 7EJ")
Flat.create(name: "Hogwarts", flat_key: rand(36**30).to_s(36), address_one: "Hogwarts School", address_two: "Hogwarts", city: "The World", postcode: "WIZ ARD")
Flat.create(name: "Flat 26", flat_key: rand(36**30).to_s(36), address_one: "Flat 26", address_two: "L Town", city: "London", postcode: "GRL PAD")

Flatmate.create(flat_id: 1, username: "MrHolmes", avatar: "https://i.imgur.com/Nepflq3.png", first_name: "Sherlock", last_name: "Holmes", email: "sherlock@holmes.com", password: "holmes", birthday: Date.parse('1985-02-01'), move_in: Date.parse('2005-02-15'), rent_due: 25, water_due: 10, electricity_due: 20)
Flatmate.create(flat_id: 1, username: "DrWatson", avatar: "https://i.imgur.com/5LN2WR9.png", first_name: "John", last_name: "Watson", email: "john@watson.com", password: "watson", birthday: Date.parse('1984-12-23'), move_in: Date.parse('2005-09-01'), rent_due: 25, water_due: 10, electricity_due: 20, gas_due: 1)
Flatmate.create(flat_id: 2, username: "harry", avatar: "https://i.imgur.com/WivCyrX.png", first_name: "Harry", last_name: "Potter", email: "harry@hogwarts.com", password: "harry", birthday: Date.parse('2000-10-01'), move_in: Date.parse('2010-09-01'), rent_due: 25, water_due: 10, electricity_due: 20, gas_due: 1)
Flatmate.create(flat_id: 2, username: "ron", avatar: "https://i.imgur.com/X4NoDrf.png", first_name: "Ron", last_name: "Weasley", email: "ron@hogwarts.com", password: "ron", birthday: Date.parse('2000-12-23'), move_in: Date.parse('2010-09-01'), rent_due: 25, water_due: 10, electricity_due: 20, gas_due: 1)
Flatmate.create(flat_id: 2, username: "hermione", avatar: "https://i.imgur.com/cUVnqbR.png", first_name: "Hermione", last_name: "Granger", email: "hermione@hogwarts.com", password: "hermione", birthday: Date.parse('2001-12-23'), move_in: Date.parse('2010-09-01'), rent_due: 25, water_due: 10, electricity_due: 20, gas_due: 1)
Flatmate.create(username: "spongebob", avatar: "https://i.imgur.com/lkEn03q.png", first_name: "Spongebob", last_name: "Squarepants", email: "spongebob@bikinibottom.com", password: "spongebob", birthday: Date.parse('1984-12-23'), move_in: Date.parse('2017-09-01'), rent_due: 25, water_due: 10, electricity_due: 20, gas_due: 1)
Flatmate.create(flat_id: 3, username: "lauren", avatar: "https://i.imgur.com/cUVnqbR.png", first_name: "Lauren", last_name: "Carne", email: "email@amail.com", password: "12345", birthday: Date.parse('1989-04-02'), move_in: Date.parse('2010-09-01'), rent_due: 25, water_due: 10, electricity_due: 20, gas_due: 1)
Flatmate.create(flat_id: 3, username: "hannah", avatar: "https://i.imgur.com/cUVnqbR.png", first_name: "Hannah", last_name: "Easter", email: "email@amail.com", password: "12345", birthday: Date.parse('1991-08-17'), move_in: Date.parse('2010-09-01'), rent_due: 25, water_due: 10, electricity_due: 20, gas_due: 1)
Flatmate.create(flat_id: 3, username: "aimee", avatar: "https://i.imgur.com/cUVnqbR.png", first_name: "Aimee", last_name: "Osmond", email: "email@amail.com", password: "12345", birthday: Date.parse('1991-05-20'), move_in: Date.parse('2010-09-01'), rent_due: 25, water_due: 10, electricity_due: 20, gas_due: 1)

Note.create(note: "You know my methods, Watson", flatmate_id: 1)
Note.create(note: "My name is Sherlock Holmes. It is my business to know what other people don’t know", flatmate_id: 1)
Note.create(note: "I trust that age doth not wither nor custom stale my infinite variety.", flatmate_id: 2)
Note.create(note: "Never trust to general impressions, my boy, but concentrate yourself upon details.", flatmate_id: 2)
Note.create(note: "Harry's Note.", flatmate_id: 3)
Note.create(note: "Ron's Note", flatmate_id: 4)
Note.create(note: "Hermione's Note.", flatmate_id: 5)
Note.create(note: "Spongebob's Note.", flatmate_id: 6)

ShoppingList.create(flat_id: 1)
ShoppingList.create(flat_id: 2)

Item.create(shopping_list_id: 1, name: "Toilet Roll")
Item.create(shopping_list_id: 1, name: "Tin Foil")
Item.create(shopping_list_id: 1, name: "Bin Bags")
Item.create(shopping_list_id: 1, name: "Window Cleaner")
Item.create(shopping_list_id: 2, name: "Wand Cleaner")
Item.create(shopping_list_id: 2, name: "Chocolate Frongs")

Task.create(flat_id: 1, name: "Bins", avatar: "https://i.imgur.com/oZOMPYk.png", description: "Take the bins out.", flatmate_id: 1, week: Date.parse('2019-07-15'))
Task.create(flat_id: 1, name: "Dishes", avatar: "https://i.imgur.com/6wmL3SR.png", description: "Wash the dishes.",  flatmate_id: 1, week: Date.parse('2019-07-15'))
Task.create(flat_id: 1, name: "Hoover", avatar: "https://i.imgur.com/YXXvwKi.png", description: "Hoover the Apartment.",  flatmate_id: 2, week: Date.parse('2019-07-15'))
Task.create(flat_id: 2, name: "Clean the Quiditch Pitch", avatar: "https://i.imgur.com/6wmL3SR.png", description: "Clean the Quiditch Pitch.",  flatmate_id: 3, week: Date.parse('2019-07-15'))
Task.create(flat_id: 2, name: "Dust the Wands", avatar: "https://i.imgur.com/YXXvwKi.png", description: "Dust the wands.",  flatmate_id: 4, week: Date.parse('2019-07-15'))

Calender.create(flat_id: 1)
Calender.create(flat_id: 2)

Event.create(flatmate_id: 1, title: "Lunch", allDay: false, start: DateTime.parse('2019-07-21-11-00'), end: DateTime.parse('2019-07-21-13'), description: "Sherlock's Event")
Event.create(flatmate_id: 2, title: "Dinner", allDay: false, start: DateTime.parse('2019-07-19-19-00'), end: DateTime.parse('2019-07-21-23'), description: "Watson's Event")
Event.create(flatmate_id: 3, title: "Weekend Away", allDay: true, start: DateTime.parse('2019-07-26-11-00'), end: DateTime.parse('2019-07-29-13'), description: "Harry's Event")
Event.create(flatmate_id: 4, title: "Breakfast", allDay: false, start: DateTime.parse('2019-07-21-11-00'), end: DateTime.parse('2019-07-21-13'), description: "Ron's Event")
Event.create(flatmate_id: 5, title: "Shopping Trip", allDay: false, start: DateTime.parse('2019-07-19-19-00'), end: DateTime.parse('2019-07-21-23'), description: "Hermione's Event")
Event.create(flatmate_id: 6, title: "Sleep Over", allDay: true, start: DateTime.parse('2019-07-26-11-00'), end: DateTime.parse('2019-07-29-13'), description: "Spongebob's Event One")
Event.create(flatmate_id: 6, title: "Sleep Over Take Two", allDay: true, start: DateTime.parse('2019-07-26-11-00'), end: DateTime.parse('2019-07-29-13'), description: "Spongebob's Event Two")
