# Seed Data

# Users
User.create(name: "Anup Khadka", email: "anup@noopmail.com", password: "anup")
User.create(name: "Jichael Mordan", email: "jichael@noopmail.com", password: "jichael")
User.create(name: "Foger Rederer", email: "foger@noopmail.com", password: "foger")
User.create(name: "Bobe Kryant", email: "bobe@noopmail.com", password: "bobe")
User.create(name: "Jebron Lames", email: "jebron@noopmail.com", password: "jebron")

Potluck.create(name: "Dashain Party", date: "2019-10-17", organizer_id: 1)
Potluck.create(name: "Independence Day Party", date: "2019-07-04", organizer_id: 2)
Potluck.create(name: "Labor Day Party", date: "2019-09-02", organizer_id: 3)
Potluck.create(name: "Christmas Party", date: "2019-12-25", organizer_id: 4)
Potluck.create(name: "New Year Party", date: "2019-12-31", organizer_id: 5)

Item.create(name:"Biryani", potluck_id: 1, user_id: 1);
Item.create(name:"Chicken Curry", potluck_id: 1, user_id: 2)
Item.create(name:"Tawa Fish", potluck_id: 1, user_id: 3)

Item.create(name:"Hot Dogs", potluck_id: 2, user_id: 4)
Item.create(name: "Beers", potluck_id: 2, user_id: 5)

Item.create(name: "Chicken Drumsticks", potluck_id: 3, user_id: 1)
Item.create(name: "Margarita", potluck_id: 3, user_id: 2)

Item.create(name: "Stuffing", potluck_id: 4, user_id: 4)
Item.create(name: "Pecan Pie", potluck_id: 4, user_id: 2)

Item.create(name: "Beers", potluck_id: 5, user_id: 1)
Item.create(name: "Fried Rice", potluck_id: 5, user_id: 2)
Item.create(name: "Chicken Nuggets", potluck_id: 5, user_id: 3)
