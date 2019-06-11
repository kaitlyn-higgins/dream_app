# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "kaitlyn@yahoo.com", zip_code: 60622, username: "NightOwl", gender: "female")
User.create(email: "shane@gmail.com", zip_code: 60622, username: "inTheHouse", gender: "male")
User.create(email: "amanda@yahoo.com", zip_code: 60604, username: "grimMagician", gender: "female")
User.create(email: "sebastian@yahoo.com", zip_code: 60625, username: "theLegerian", gender: "male")

Dream.create(user_id: 1, title: "Capture The Flag", content: "I was part of a social experiment where participants were living in forest patches and battling against each other. Wildlife was prevalent, many snakes and spiders everywhere. We were provided a ration of two tacos per day. I managed to get my hands on a couple extra special fish tacos that weren't supposed to be available to us, and got caught with the contraband. At one point I escaped death when our transportation vehicle was upended.", image_url: "https://cdn.imgbin.com/10/14/9/imgbin-island-taco-mexican-cuisine-food-bean-taco-fUSqSLvydjXkVbqeq6yU2Guk8.jpg")
Dream.create(user_id: 1, title: "Chili", content: "I was making chili at Harry Carays, and I needed to impress someone with it who was coming in - but the chili sucked. It was super flavorless. I was out of time, but I needed to spice it up! I shouted for jalapenos, chopped them up, and stirred them in without cooking the chili more. It didn't improve. I drizzled it with a sour cream mountain hoping the person would assume the chili was good originally, but made bland by all the sour cream.", image_url: "https://img.wonderhowto.com/img/03/28/63593894282173/0/oops-food-too-spicy-heres-fix.w1456.jpg")
Dream.create(user_id: 2, title: "Bicycles", content: "I was riding my bike to go fetch some churros, when a bunny hopped out in front of my bike. I slammed on the brakes and flew off of the bike, missing the bunny. The bunny's owner ran down the street and thanked me for stopping, apologized that I got grass stains all over my clothes, and offered me free churros for life at his mexican restuarant, which I was on my way to in the first place!", image_url: "https://media1.tenor.com/images/4361f579a306bfd001c12c77cdf5c024/tenor.gif?itemid=10759370")
Dream.create(user_id: 3, title: "Trampoline Keyboard", content: "I invented a trampoline that had a keyboard attached to it, which would go up and down as I bounced so I could play music while I jumped. It was sweet.", image_url: "https://www.edwinmsarmiento.com/wp-content/uploads/2014/12/dsc_9140-760x503.jpg")
Dream.create(user_id: 4, title: "Hiking", content: "I was hiking in the appalacian mountains with Burt Reynolds, and there was a man with a taco stand. Perplexed, but excited, I scooped two fish tacos and two al pastor. They were the best tacos I've ever had in my life. Burt had a taco salad instead.", image_url: "https://66.media.tumblr.com/tumblr_ljyyisQQtg1qb40pro1_1280.png")

Tag.create(dream_id: 1, name: "tacos")
Tag.create(dream_id: 1, name: "contraband")
Tag.create(dream_id: 1, name: "experiment")
Tag.create(dream_id: 1, name: "escapingDeath")
Tag.create(dream_id: 1, name: "forest")
Tag.create(dream_id: 1, name: "snakes")
Tag.create(dream_id: 1, name: "spiders")
Tag.create(dream_id: 2, name: "chili")
Tag.create(dream_id: 2, name: "jalapenos")
Tag.create(dream_id: 2, name: "sourCream")
Tag.create(dream_id: 2, name: "HarryCarays")
Tag.create(dream_id: 3, name: "bicycle")
Tag.create(dream_id: 3, name: "bunny")
Tag.create(dream_id: 3, name: "churros")
Tag.create(dream_id: 3, name: "free")
Tag.create(dream_id: 4, name: "trampoline")
Tag.create(dream_id: 4, name: "keyboard")
Tag.create(dream_id: 4, name: "invention")
Tag.create(dream_id: 5, name: "hiking")
Tag.create(dream_id: 5, name: "tacos")
Tag.create(dream_id: 5, name: "burtReynolds")
Tag.create(dream_id: 5, name: "tacoSalad")
Tag.create(dream_id: 5, name: "surprise")