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



// string

function socialChat(xxxx){
    var logOn = true
        if (logOn === true) {
		console.log(app +" opens up.");
	
	} else { 
		console.log("logged out. Must enter user name and xxxx");
	};
	return logOn;
};



// json data for ichat "aim" app for phone

var json = {
    "teachers":{
        "1234":{
            name : "Lee",
            age  : 35,
            email: "llewis@fullsail.com"
        },
        "1235":{
            name : "Jen",
            age  : 29,
            email: "jmccarrick@fullsail.com"
        },
        "1236":{
            name : "Chad",
            age  : 32,
            email: "fschad@me.com"
        },
    
    },    

};




// array

var ichatStudentsGuys = new Array("Dave", "Mo", "Joe", "Kurt", "Chris", "Michael");
var ichatStudentsGals = new Array("Sabra", "Julie", "Katie", "Amanda", "Randi", "Kathy");

var studentLookup = ichatStudentsGuys.concat(ichatStudentsGals);


    


// object

function project(name, dueDate){
    this.name  = name;
    this.dueDate = dueDate;
    this.SDIproject3Due = daysTillDue;
}

function daysTillDue(){
    var daysLeft = 7 - this.dueDate;
    return daysLeft;
}

var project3 = new project("SDI Project 3", 8);


// Returned Values

checkFace("password");

var returnlockOut = passwordFail(phLock);

socialChat("password");

for (var key in json.teachers){
    var teacher = json.teachers[key]
    console.log(teacher.email);
    
console.log(studentLookup[1]);

console.log(project3.SDIproject3Due());
};







