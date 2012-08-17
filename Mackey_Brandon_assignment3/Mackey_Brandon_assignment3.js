//alert("JavaScript works!");

// Brandon Mackey	
// August 17, 2012
// SDI Wk 3 Project 3
// 1208 
// Story making own flowchart

var phone = "Samsung Galaxy S3";
var face = "face recognition";
var app = "ichat";
var arrFriend = ["Lee", "Jen", "Chad"];
var phLock = 3;
var unlocked = true;

// boolean 

function checkFace(xxxx) {
        if (unlocked === false) {
            console.log("Phone unlocked, Welcome to the " + phone + "!");
        } else {
            console.log ("Error! poor lighting. Enter " + xxxx + ".");
        }
        return checkFace    
};

 
// number w/while loop , local var 

var passwordFail = function(failedCode){
    var lockOut = 5;
	while (failedCode > 2 - 1 ){
		console.log("Error! Wrong password try again. " + failedCode + " more attempts")	
		failedCode--;
		
	}
	console.log("You got it!.");
	return lockOut;
};










