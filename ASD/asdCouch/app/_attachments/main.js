$('#home').on('pageinit', function(){
	//code needed for home page goes here
});	

$('#additem').on('pageinit', function(){
    delete $.validator.methods.date;
    var myForm = $('#additemform'); 
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
	$('#deleteAll').on("click", deleteAll);
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


var getData = function () {
   if (localStorage.length === 0) {
        //alert("There is no data in Local Storage.");
        //autoFillData();
        // -- Comment Out Reload Page when using Test JSON Data Uncommit when not testing!! --
        //window.location.reload();
        //}
        //if ($("#items")){
        //$("#items").innerHTML="";
    } else {
        var makeDiv = document.createElement('div');
        makeDiv.setAttribute("id", "listItem");
	var makeList = document.createElement('ul');
        makeDiv.appendChild(makeList);
        $('#items').append(makeDiv);
        for (var i = 0, len = localStorage.length; i < len; i++) {
	    var makeLi = document.createElement('li');
            var linksLi = document.createElement('li');
            makeList.appendChild(makeLi);
            var key = localStorage.key(i);
            var value = localStorage.getItem(key);
            // convert the string from local storage value back to an object by JSON.parse  
            var obj = JSON.parse(value);
            var makeSubList = document.createElement('ul');
	    var editLink = $('<button>');
		editLink.attr("key", key);
	    var editButton = "Edit List";
	    var deleteLink = $("<button>");
		deleteLink.attr("key", key);
	    var deleteButton = "Delete";
	    editLink.attr("href", "#additem");
	    deleteLink.attr("href", "#displayPage");
	    editLink.text(editButton);
	    deleteLink.text(deleteButton);
	    editLink.appendTo(linksLi);
	    deleteLink.appendTo(linksLi);
            makeLi.appendChild(makeSubList);
            //getImage(obj.group[1], makeSubList);
            for (var n in obj) {
                var makeSubLi = document.createElement('li');
                makeSubList.appendChild(makeSubLi);
                var optSubText = obj[n][0] + "" + obj[n][1];
                makeSubLi.innerHTML = optSubText;
                makeSubList.appendChild(linksLi);
            }
            //makeItemLinks(localStorage.key(i), linksLi); // create edit and delete buttons/link for each item in local storage.
	    editLink.on("click", editItem);
	    deleteLink.on("click", deleteItem);	
        }
    }
    $.ajax({
        "url": '_view/tasks',
	"type": 'GET',
        "dataType": "json",
        "success": function (data) {
	    console.log(data);
            $.each(data.rows, function (index, tasks) {
                var type = tasks.value.Type;
                var priority = tasks.value.Priority;
		var date = tasks.value.Date;
		var quantity = tasks.value.Quantity;
                $('#displayPage').append(
		    $('<li>').append(
			$('<a>').attr("href", "#")
			    .text(type)));
	    });
            $('displayPage').listview('refresh');
        }
    });

};


// ** CSS **
$('#displayLink').css('margin-left','100px');
 

var storeData = function(data){
    if(!data.key){
	    // key number for your object (random #) 
	    var id = Math.floor(Math.random()*10000001);
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


var	deleteItem = function (key){
	console.log("deleteItem called");
	ask = confirm("Are you sure you want to Delete this List?");
	if(ask){
	    // .remove will not delete the list So .clear was inserted
	    localStorage.removeItem($(this).attr("key"));
	    alert("List was deleted!");
	    window.location.reload();
	}else{
	    alert("List was NOT deleted.");
	}
    
};

var	deleteAll = function (){
	console.log("deleteALL called");
	ask = confirm("Are you sure you want to Delete All Lists?");
	if(ask){
	    // .remove will not delete the list So .clear was inserted
	    localStorage.clear(this.key);
	    alert("List was deleted!");
	    window.location.reload();
	}else{
	    alert("List was NOT deleted.");
	}
    
};

// ** CSS **
$('#deleteAll').css('margin-left','200px');

    
var editItem = function(key){
	console.log("editItem called");
	// grab the data from local storage.
	var value = localStorage.getItem($(this).attr("key"));
	var item = $.parseJSON(value);
	console.log(item);
	// show the form
	
	// populate the form fields with current localStorage values.
	$('#groups').val = (item.group[1]);
	$('input:radio[name=importance]:checked').val();
	var radios = document.forms[0].importance;
	for(var i=0; i<radios.length; i++){
	    if(radios[i].val =="High Priority" && item.importance[1] == "High Priority"){
		radios[i].attr("checked", "checked");
	    }else if(radios[i].val == "Low Priority" && item.importance[1] == "Low Priority"){
		radios[i].attr("checked", "checked");
	    }
	$('#date').val = (item.date[1]);
	$('#range').val = (item.range[1]);
	$('#what').val = (item.what[1]);
	$('#where').val = (item.where[1]);
	$('#notes').val = (item.notes[1]);
	}
	if(fav[1] == "Yes"){
	    $('#fav').attr("checked", "checked");
	}
	$.mobile.changePage("#additem");
	localStorage.removeItem(this.key);
	// Remove the initial listener from the input 'save List' (saveIt) button
	var saveIt = $('submit');
	$('#saveIt').unbind("click", storeData );
	// Change Save It Now button value to Edit button.
	$('#submit').val = "Edit List";
	var editSubmit = $('#submit');
	// Save the key value established in this function as a property of the editSubmit event
	// so we can use that value when we save the data we edited.
	$('editSubmit').on("click", editItem);
	editSubmit.key = this.key;
    };








var clearLocal = function(){
   if(localStorage.length === 0){
            alert("There is no data to clear.");
        }else{
            localStorage.clear();
            alert("All Lists are deleted!");
            window.location.reload();
            return false;
        }
};