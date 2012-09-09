/*
Brandon Mackey
Web App Part 2
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
            
            }
        }   
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


    // variables defaults
    var dropList = ["--Choose A List--", "Grocery List", "Don't Forget!", "Wish List", "Honey Do List!" ],
        priorityValue,
        favoriteValue = "No",
        newValue
    ;
    makeDropDown();
    
    // set link & submit click events
    var displayLink = $('displayLink');
    displayLink.addEventListener("click", getData);
    var clearLink = $('clear');
    clearLink.addEventListener("click", clearLocal);
    var saveIt = $('submit');
    saveIt.addEventListener("click", storeData);
});  
    
    