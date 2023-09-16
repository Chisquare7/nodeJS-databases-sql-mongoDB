// a. Creation of all the entities
db.createCollection("categories");
db.createCollection("users");
db.createCollection("managers");
db.createCollection("admin");
db.createCollection("suppliers");
db.createCollection("items");
db.createCollection("orders");
db.createCollection("warehouses");
db.createCollection("stocks");

// b. Inserting records into the entities

// insert into categories

db.categories.insertOne({
	_id: 1,
	name: "Clothing",
	descripiton: "A category of items that are worn on the body",
	category_image_url: "https://sample.com/clothing-category.jpg",
});

db.categories.insertOne({
	_id: 2,
	name: "Shoes",
	descripiton: "A category of items that are worn on the feet",
	category_image_url: "https://sample.com/shoes-category.jpg",
});

db.categories.insertOne({
	_id: 3,
	name: "Accessories",
	descripiton: "A category of items that are worn or carried with clothing",
	category_image_url: "https://sample.com/accessories-category.jpg",
});

// insert into users

db.users.insertOne({
	_id: 1,
	name: "Donatus John",
	address: "234 Broad street, Island",
	email: "donatus.john@sample.com",
	password: "donatusjohn123",
	phone_number: "234-567-8975640",
	gender: "male",
});

db.users.insertOne({
	_id: 2,
	name: "Gloria Nice",
	address: "61 Daylight street, V.I",
	email: "gloria.nice@sample.com",
	password: "nicegloria876",
	phone_number: "444-876-45364208",
	gender: "female",
});

db.users.insertOne({
	_id: 3,
	name: "Phillip Iron",
	address: "546 Iron man street, Lekki",
	email: "iron.phillip@sample.com",
	password: "phillip.iron345",
	phone_number: "556-876-123456709",
	gender: "male",
});

// insert into managers

db.managers.insertOne({
	_id: 1,
	name: "Winifred Johnson",
	email: "winifred.johnson@sample.com",
	password: "winifred657",
	phone_number: "234-758-90864580",
	gender: "female",
});

db.managers.insertOne({
	_id: 2,
	name: "Hannah Oluwo",
	email: "hannah.oluwo@sample.com",
	password: "hannaholu908",
	phone_number: "564-980-653474869",
	gender: "female",
});

db.managers.insertOne({
	_id: 3,
	name: "Adeyinka Afred",
	email: "adeyinka.afred@sample.com",
	password: "adeafred6745",
	phone_number: "243-564-875645343",
	gender: "male",
});

// insert into admin

db.admin.insertOne({ _id: 1, name: "David Robert", role: "management_admin" });
db.admin.insertOne({ _id: 2, name: "Tosin Kolawole", role: "user_admin" });
db.admin.insertOne({
	_id: 3,
	name: "Ayinla Olatunde",
	role: "management_admin",
});

// insert into suppliers

db.suppliers.insertOne({
	_id: 1,
	name: "Oak Clothings",
	address: "234 Oak Street, Clothing Village",
	contact_info: "546-564-89647639",
	supplier_website: "https://www.oakclothings.com",
	terms_and_conditions: "https://www.oakclothings.com/terms-and-conditions",
});

db.suppliers.insertOne({
	_id: 2,
	name: "Shoe Showroom",
	address: "78 Shoe Street, Shoe Village",
	contact_info: "876-980-89647639",
	supplier_website: "https://www.shoeshowroom.com",
	terms_and_conditions: "https://www.shoeshowroom.com/terms-and-conditions",
});

db.suppliers.insertOne({
	_id: 3,
	name: "Accessories",
	address: "54 Accessories Street, Accessory Village",
	contact_info: "345-765-65477639",
	supplier_website: "https://www.accessoriesdepot.com",
	terms_and_conditions: "https://www.accessoriesdepot.com/terms-and-conditions",
});

// insert into items

db.items.insertOne({
	_id: 1,
	name: "Grey Shirt",
	description: "A classic grey shirt.",
	price: 1000,
	size: "small",
	quantity_in_stock: 10,
	reorder_level: 5,
	item_image_url: "https://sample.com/grey-shirt.jpg",
	category_id: 1,
	supplier_id: 1,
});

db.items.insertOne({
	_id: 2,
	name: "Black Shoe",
	description: "A pair of black shoes.",
	price: 5000,
	size: "large",
	quantity_in_stock: 25,
	reorder_level: 10,
	item_image_url: "https://sample.com/black-shoe.jpg",
	category_id: 2,
	supplier_id: 2,
});

db.items.insertOne({
	_id: 3,
	name: "Necklaces",
	description: "A silver colored Necklace.",
	price: 3000,
	size: "medium",
	quantity_in_stock: 50,
	reorder_level: 30,
	item_image_url: "https://sample.com/necklace.jpg",
	category_id: 3,
	supplier_id: 3,
});

// insert into orders

db.orders.insertOne({
	_id: 1,
	quantity: 5,
	order_status: "pending",
	order_total_price: 5000,
	payment_method: "cash",
	shipping_address: "234 Mapple Street, Sample Village",
	order_date: Date(),
	item_id: 1,
	user_id: 1,
	admin_id: 2,
	manager_id: 2,
});

db.orders.insertOne({
	_id: 2,
	quantity: 50,
	order_status: "approved",
	order_total_price: 100000,
	payment_method: "wire transfer",
	shipping_address: "68 Oak Street, Shoe Village",
	order_date: Date(),
	item_id: 2,
	user_id: 2,
	admin_id: 1,
	manager_id: 1,
});

db.orders.insertOne({
	_id: 3,
	quantity: 20,
	order_status: "returned",
	order_total_price: 20000,
	payment_method: "cheque",
	shipping_address: "676 Mupple Street, Shane Town",
	order_date: Date(),
	item_id: 3,
	user_id: 3,
	admin_id: 3,
	manager_id: 3,
});

// insert into warehouses

db.warehouses.insertOne({
	_id: 1,
	location: "Warehouse Location 1",
	warehouse_capacity: 2000,
	manager_id: 1,
});

db.warehouses.insertOne({
	_id: 2,
	location: "Warehouse Location 2",
	warehouse_capacity: 5000,
	manager_id: 2,
});

db.warehouses.insertOne({
	_id: 3,
	location: "Warehouse Location 3",
	warehouse_capacity: 7000,
	manager_id: 3,
});

// insert into stocks

db.stocks.insertOne({
	_id: 1,
	quantity: 20,
	last_updated: Date(),
	item_id: 1,
	warehouse_id: 1,
});

db.stocks.insertOne({
	_id: 2,
	quantity: 50,
	last_updated: Date(),
	item_id: 2,
	warehouse_id: 3,
});

db.stocks.insertOne({
	_id: 3,
	quantity: 75,
	last_updated: Date(),
	item_id: 3,
	warehouse_id: 1,
});


// c. Getting records from two or more entities

// Get records from items

db.items.find({ _id: 3 });

// Get records from users

db.users.find({ _id: 1 });

// Get records from orders

db.orders.find({ _id: 2 });


// d. Updating records from two or more entities

// Update record in items

db.items.updateOne(
	{ _id: 1 },
	{
		$set: {
			name: "Red Shirt",
			description: "A classic red shirt",
			item_image_url: "https://sample.com/red-shirt.jpg",
		},
	}
);

// Update record in users

db.users.updateOne(
	{ _id: 2 },
	{
		$set: {
			name: "Omotola Oshodi",
			email: "osho.omotola@sample.com",
			password: "osho.omotola6457",
		},
	}
);

// Update record in admin

db.admin.updateOne(
	{ _id: 3 },
	{ $set: { name: "John Afred", role: "user_admin" } }
);


// e. Deleting records from two or more entities

// Delete records in orders

db.orders.deleteOne({ _id: 3 });

// Delete records in stocks

db.stocks.deleteOne({ _id: 1 });

//Delete records in warehouses

db.warehouses.deleteOne({ _id: 2 });