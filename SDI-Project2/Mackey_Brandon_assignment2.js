//alert("JavaScript works!");

// Brandon Mackey	
// August 8, 2012
// SDI Wk 2 Project 2
// Story into code

var brandon = "Dad";
var son = "Gage";
var bkToEat = ["oatmeal", "cereal", "fruit"];
var spitOut = false;
var makesSmile = true;
var time = 10;

// procedure 
var letsEat = function(son){
	if (makesSmile === true){
		console.log("Its time to eat some breakfast "+ son+" hope you like what I made."); // output	
	} else {
		console.log("I guess you do not like it so I will make you something else.");	// output
	}
	
};
letsEat("Gage");

// boolean function 
var us = function(Dad, Gage){
	if (spitOut === false){
		console.log("We are all out of food you like "+ son +". " + brandon + " will go get you some chicken nuggets from McDonolds");  // output
	} else {
		console.log("If you don't like it, you don't have to eat it!" );
	}
	return true 
};
us("brandon", "son");

// number function
	var cookTime = 10
	while (cookTime > 0){
		console.log(cookTime +" minutes until you lunch is done cooking.")	
		cookTime--;
};
console.log("Time is up on your food little man. Time to eat.");

// string function

var strfunction = function(){
	if (brandon === "Dad" + son === "Gage") {
		console.log(son +" and " + brandon +" had a wonderful McDonolds lunch now it time to play some Xbox.");
	
	} else { 
		console.log(son + " and " + brandon + " didn't like the McDonolds is we went to the store to go shopping for some real food.");
	};
	
};
strfunction()

// array function 

	
	
	
	
	
	
	
	
	
	