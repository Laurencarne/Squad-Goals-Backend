Flatmate.create(username: "MrHolmes", first_name: "Sherlock", last_name: "Holmes", email: "sherlock@holmes.com", password: "holmes", birthday: Date.new(1985,2,1), move_in: Date.new(2019,2,15), rent_due: 25, water_due: 10, electricity_due: 20)
Flatmate.create(username: "DrWatson", first_name: "John", last_name: "Watson", email: "john@watson.com", password: "watson", birthday: Date.new(1984,12,23), move_in: Date.new(2017,9,1), rent_due: 25, water_due: 10, electricity_due: 20, gas_due: 1)

Note.create(note: "You know my methods, Watson", flatmate_id: 1)
Note.create(note: "My name is Sherlock Holmes. It is my business to know what other people don’t know", flatmate_id: 1)
Note.create(note: "I trust that age doth not wither nor custom stale my infinite variety.", flatmate_id: 2)
Note.create(note: "Never trust to general impressions, my boy, but concentrate yourself upon details.", flatmate_id: 2)
