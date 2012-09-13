/*
Brandon Mackey
Web App Part 3
Term 1209
Sept 2, 2012
VFW
*/

// Wiat till DOM is Ready
window.addEventListener("DOMContentLoaded", function(){

    // get function by id
    function $(x){
        var theElement = document.getElementById(x);
        return theElement;
    }

    // create a select field "drop down box"
    function makeDropDown(){
        var formtag =document.getElementsByTagName("form"); // formtag is Array
            selectLi = $('select'),
            makeSelect = document.createElement('select');
            makeSelect.setAttribute("id", "groups");
        for(var i=0, j=dropList.length; i<j; i++){
            var makeOption = document.createElement('option');
            var optText = dropList[i];
            makeOption.setAttribute("value", optText);
            makeOption.innerHTML = optText;
            makeSelect.appendChild(makeOption);
        }
        selectLi.appendChild(makeSelect);
    }


    // Find value of Radio button 
    function getSelectedRadio(){
        var radios =document.forms[0].importance;
        for(var i=0; i<radios.length; i++){
            if (radios[i].checked){
                priorityValue = radios[i].value;
            }
        } 
    }

    function getCheckBoxValue(){
        if($('fav').checked){
            favoriteValue = $('fav').value
        }else{
            favoriteValue = "No"
        }
    }
    
       /*Quantity function to give slider a value
    function showValue(newValue){
	document.getElementById("range").innerHTML=newValue;
    }
*/
    
    function toggleControls(n){
        switch(n){
            case "on":
                $('listForm').style.display = "none";
                $('clear').style.display = "inline";
                $('displayLink').style.display = "none";
                $('addNew').style.display = "inline";
                break;
            case "off":
                $('listForm').style.display = "block";
                $('clear').style.display = "inline";
                $('displayLink').style.display = "inline";
                $('addNew').style.display = "none";
                $('items').style.display = "none";
                break;
            default:
                return false;
        }
    }
    
    // save local storage from form field
    function storeData (){
        // key number for your object (random #) 
        var id              = Math.floor(Math.random()*10000001);
        getSelectedRadio();
        getCheckBoxValue();
        var item            ={};
            item.group      =["Type:", $('groups').value];
            item.importance =["Priority:", priorityValue];
            item.date       =["Date:", $('date').value];
            item.quantity   =["Quantity:", $('range').value];
            item.what       =["What:", $('what').value];
            item.where      =["Where:", $('where').value];
            item.notes      =["Notes:", $('notes').value];
            item.favorite   =["Favorite:", favoriteValue];
        localStorage.setItem(id, JSON.stringify(item));
        alert("Your List has been Saved!");
        window.location.reload();
    }
        
    // write data from local storage to the browser
    function getData(){
        toggleControls("on");
        if(localStorage.length === 0){
            alert("There is no data in Local Storage!");
            window.location.reload();
        }
        var makeDiv = document.createElement('div');
        makeDiv.setAttribute("id", "items");
        var makeList = document.createElement('ul');
        makeDiv.appendChild(makeList);
        document.body.appendChild(makeDiv);
        $('items').style.display = "block";
        for (var i=0, len=localStorage.length; i<len; i++){
            var makeLi = document.createElement('Li');
	    var linksLi =document.createElement('li');
            makeList.appendChild(makeLi);
            var key =localStorage.key(i);
            var value = localStorage.getItem(key);
            // convert the string from local storage value back to an object by JSON.parse  
            var obj = JSON.parse(value);
            var makeSubList = document.createElement('ul');
            makeLi.appendChild(makeSubList);
            for (var n in obj){
                var makeSubLi = document.createElement('li');
                makeSubList.appendChild(makeSubLi);
                var optSubText = obj[n] [0]+""+obj [n][1];
                makeSubLi.innerHTML = optSubText;
		makeSubList.appendChild(linksLi);
            }
	    makeItemLinks(localStorage.key(i), linksLi); // create edit and delete buttons/link for each item in local storage.
	}   
    }

    // make item links function
    // create the edit and delete links for each stored item when displayed.
    function makeItemLinks(key, linksLi){
	// add edit single item link
	var editLink = document.createElement('a');
	editLink.href = "#";
	editLink.key = key;
	var editText = "Edit List";
	editLink.addEventListener("click", editItem);
	editLink.innerHTML = editText;
	linksLi.appendChild(editLink);
	
	// add line break
	//var breakTag = document.createElement('br');
	//linksLi.appendChild(breakTag);
	
	
	
	// add delete single item link
	var deleteLink = document.createElement('a');
	deleteLink.href = "#";
	deleteLink.key = key;
	var deleteText = "Delete List";
	//deleteLink.addEventListener("click", deleteItem);
	deleteLink.innerHTML = deleteText
	linksLi.appendChild(deleteLink);
    }
    
    function editItem(){
	// grab the data from local storage.
	var value = localStorage.getItem(this.key);
	var item = JSON.parse(value);
	
	// show the form
	toggleControls("off");
	
	// populate the form fields with current localStorage values.
	$('groups').value = item.group[1];
	var radios = document.forms[0].importance;
	for(var i=0; i<radios.length; i++){
	    if(radios[i].value =="High Priority" && item.importance[1] == "High Priority"){
		radios[i].setAttribute("checked", "checked");
	    }else if(radios[i].value == "Low Priority" && item.importance[1] == "Low Priority"){
		radios[i].setAttribute("checked", "checked");
	    }
	$('date').value = item.date[1];
	$('range').value = item.range;
	$('what').value = item.what[1];
	$('where').value = item.where[1];
	$('notes').value = item.notes[1];
	}
	if(item.favorite[1] == "Yes"){
	    $('fav').setAttribute("checked", "checked");
	}
	// Remove the initial listener from the input 'save List' (saveIt) button
	saveIt.removeEventListener("click", storeData );
	// Change Save It Now button value to Edit button.
	$('submit').value = "Edit List";
	var editSubmit = $('submit');
	// Save the key value established in this function as a property of the editSubmit event
	// so we can use that value when we save the data we edited.
	editSubmit.addEventListener("click", validate);
	editSubmit.key = this.key;
    }
    
    
    
    function clearLocal(){
        if(localStorage.length === 0){
            alert("There is no data to clear.")
        }else{
            localStorage.clear();
            alert("All Lists are deleted!");
            window.location.reload();
            return false;
        }
    }

    
    function validate(e){
	// define the element we want to check
	var getGroup = $('groups');
	//var getDate = $('date');
	var getWhat = $('what');
	var getWhere = $('where');
	
	// Reset Error Messages
	errMsg.innerHTML = "";
	getGroup.style.border = "1px solid black";
	//getDate.style.border  = "1px solid black";
	getWhat.style.border  = "1px solid black";
	getWhere.style.border = "1px solid black";
	
	// Get error messagesontc
	var messageAry = [];
	// Group validation
	if(getGroup.value === "--Choose A List--"){
	    var groupError = "Please choose a List.";
	    getGroup.style.border = "1px solid red";
	    messageAry.push(groupError);
	}
	
	// Date validation
	//var re = ^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$;
	//if(!(re.test(getDate.value))){
	    //var dateError = "Please input a Date.";
	    //getDate.style.border = "1px solid red";
	    //messageAry.push(dateError);
	//}
	
	// What validation
	if(getWhat.value === ""){
	    var whatError = "Please enter what you want.";
	    
	    getWhat.style.border = "1px solid red";
	    messageAry.push(whatError);
	} 
	
	// Where validation
	if(getWhere.value === ""){
	    var whereError = "Please enter where you will get it.";
	    getWhere.style.border = "1px solid red";
	    messageAry.push(whereError);
	}
	
	// If there were errors, display them on the screen.
	if(messageAry.length >= 1){
	    for(var i=0, j=messageAry.length; i < j; i++){
		var txt = document.createElement('li');
		txt.innerHTML = messageAry[i];
		txt.style.color = "red";
		errMsg.appendChild(txt);
	    }
	    e.preventDefault();
	return false;
	}else{
	    //if all is ok save our data
	    storeData();
	}
	
    }

    
    
    // variables defaults
    var dropList = ["--Choose A List--", "Grocery List", "Don't Forget!", "Wish List", "Honey Do List!" ],
        priorityValue,
        favoriteValue = "No",
        newValue,
	errMsg = $('errors')
    ;
    makeDropDown();
    
    // set link & submit click events
    var displayLink = $('displayLink');
    displayLink.addEventListener("click", getData);
    var clearLink = $('clear');
    clearLink.addEventListener("click", clearLocal);
    var saveIt = $('submit');
    saveIt.addEventListener("click", validate);
});  
    
    