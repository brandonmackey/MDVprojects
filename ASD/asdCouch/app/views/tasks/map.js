function (doc){
	if (doc._id.substr(0, 4) === "list"){
		emit(doc._id, {
			"Type": doc.Type,
			"Priority": doc.Priority,
			"Date": doc.Date,
			"Quantity": doc.Quantity,
			"What": doc.What,
			"Where": doc.Where,
			"Notes": doc.Notes,
			"Favorite": doc.Favorite
		});
	} 
};