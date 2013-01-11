$('#home').on('pageinit', function(){
	//code needed for home page goes here
});	

$('#additem').on('pageinit', function(){
    delete $.validator.methods.date;
    var myForm = $('#additemform'),
	errorsLink = $('#errorsLink')
    ; 
    myForm.validate({
	invalidHandler: function(form, validator) {
	    errorsLink.click();
	    var html = "";
	    for(var key in validator.submitted){
		var label = $('label[for^="'+ key +'"]').not('[generated]');
		var legend = label.closest('fieldset').find('.ui-controlgroup-label');
		var fieldName = legend.length ? legend.text() : label.text();
		html+= '<li>'+ fieldName +'</li>';
	    };
	    $("#errors ul").html(html);
	},
	submitHandler: function() { 
		var data = myForm.serializeArray();
		storeData(data);
	}  
    });
	
	//any other code needed for addItem page goes here
	$('#clear').on("click", clearLocal);
});


$('#displayPage').on('pageinit', function(){
	getData();
	$('#deleteItem').on("click", deleteItem);
	$('#editItem').on("click", editItem);
});


//The functions below can go inside or outside the pageinit function for the page in which it is needed.

var autoFillData = function (){
	// The actaul JSON Object data required for this to work is coming from our JSON.js file.
	// Store the JSON Object into Local Storage
	for(var n in json){
	    var id = Math.floor(Math.random()*10000001);
	    localStorage.setItem(id, JSON.stringify(json[n]));
	}
};
//console.log("fire ok");
var getData = function(){
   if(localStorage.length === 0){
           
	} else {
	var makeDiv = document.createElement('div');
        $(makeDiv).attr("id", "listItem");
        var makeList = document.createElement('ul');
        $(makeDiv).append(makeList);
	$('#items').append(makeDiv);
        for (var i=0, len=localStorage.length; i<len; i++){
            var makeLi = document.createElement('Li');
	    var linksLi =document.createElement('li');
            $(makeList).append(makeLi);
            var key =localStorage.key(i);
            var value = localStorage.getItem(key);
            // convert the string from local storage value back to an object by JSON.parse  
            var obj = JSON.parse(value);
            var makeSubList = document.createElement('ul');
            $(makeLi).append(makeSubList);
            //getImage(obj.group[1], makeSubList);
	    for (var n in obj){
                var makeSubLi = document.createElement('li');
                $(makeSubList).append(makeSubLi);
                var optSubText = obj[n] [0]+""+obj [n][1];
                $(makeSubLi).html(optSubText);
		$(makeSubList).append(linksLi);
            }
	    //makeItemLinks(localStorage.key(i), linksLi); // create edit and delete buttons/link for each item in local storage.
	}
	}
    };

var storeData = function(data){
    if(!data.key){
	    // key number for your object (random #) 
	    var id              = Math.floor(Math.random()*10000001);
	}else{
	    // Set the id to the existing key we're editing so that will save over the data.
	    // The key is the sam ekey that's been passed alond from the editSubmit event handler
	    // to the validate function, and then passed here, into the storeData function.
	    id = key;
	}
	//getSelectedRadio();
        //getCheckBoxValue();
        var item            ={};
            item.group      =["Type: ", $('#groups').val()];
            item.importance =["Priority:", $('input:radio[name=importance]:checked').val()];
            item.date       =["Date: ", $('#date').val()];
            item.quantity   =["Quantity: ", $('#range').val()];
            item.what       =["What: ", $('#what').val()];
            item.where      =["Where: ", $('#where').val()];
            item.notes      =["Notes: ", $('#notes').val()];
            item.favorite   =["Favorite:", $('#fav').val()];
        localStorage.setItem(id, JSON.stringify(item));
        alert("Your List has been Saved!");
        location.reload();
    };


var	deleteItem = function (){
	ask = confirm("Are you sure you want to delete this List?");
	if(ask){
	    // .remove will not delete the list So .clear was inserted
	    console.log(this.key);
	    localStorage.clear(this.key);
	    alert("List was deleted!");
	    window.location.reload();
	}else{
	    alert("List was NOT deleted.");
	}
    
};

var editItem = function(data){
	// grab the data from local storage.
	var value = localStorage.getItem(this.key);
	var item = JSON.parse(value);
	console.log(value);
	$.mobile.changePage( "#displayPage");
	$('#date').val('date'[1]);
	$('#range').val('range'[1]);
	$('#what').val('what'[1]);
	$('#where').val('where'[1]);
	$('#notes').val('notes'[1]);
	//}
	if('favorite'[1] == "Yes"){
	    $('#fav').attr("checked", "checked");
	    
	}
	console.log("fire ok");
    };


var clearLocal = function(){
   if(localStorage.length === 0){
            alert("There is no data to clear.")
        }else{
            localStorage.clear();
            alert("All Lists are deleted!");
            window.location.reload();
            return false;
        }
};