function (doc){
	if (doc._id.substr(0, 5) === "1list"){
		emit(doc._id, {
			"Type": doc.type,
			""Priority": doc.priority
		});
	} 
};