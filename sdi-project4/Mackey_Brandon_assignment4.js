
// Brandon Mackey
// Augest 22, 2012
// SDI 1208 Wk 4
// Project 4: My Library



var myLibrary = function(){

    // Find the number of days difference between two dates.
    
    var daysTill = function(today,birthday){
        var javaDay  = 24*60*60*1000; // hours*minutes*seconds*milliseconds
        today        = new Date(today);
        birthday     = new Date(birthday);
        var diffDate = Math.abs((today.getTime() - birthday.getTime())/(javaDay));
        return diffDate
    };
    
    
    
    // Format a number to use a specific number of decimal places, as for money:

    var myNum = function(profits){
        var twoDecimal = profits.toFixed(2)  //returns 3.14
        
        return twoDecimal
    
    };
    

    // Given a string version of a number such as "42", return the value as an actual Number, such as 42.

    var myNum2  = function(oldString){
	    if(isNaN(oldString)){                                       // Nan = Not a Number
		numToString = "Sorry items in string not numbers";
		}
		else
		{
		numToString = Number(oldString);
		return numToString;
	    };
	};

    // Does a string follow an aaa@bbb.ccc pattern like an email address?
    
    var myEmail = function(emailHere){
                        //Regex code for email validation below short ver. / long ver.   /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		check = /^[a-zA-Z0-9._%+-]+@{1}[a-zA-Z0-9-]+\.[a-zA-Z]{2,11}$/;
		validateEmail = check.test(emailHere);

		return validateEmail;
	};

    // Is the string a URL? (Does it start with http: or https:?
    
    var checkURL = function(myURL){
		var first =myURL.substring(0,myURL.indexOf(":"));  // if string starts with http: or https: = true
		if ((first ==="http") || (first === "https")){
			return true;
		} else{
			return false;
		};
	};





// returns 
    return{                     
        "daysTill": daysTill,
        "myNum"   : myNum,
        "myNum2"  : myNum2,
        "myEmail" : myEmail,
        "checkURL": checkURL
    
    };
    
    
    
};

var newLib = new myLibrary();

console.log(newLib.daysTill("2012,07,22", "2013,06,17"));
console.log(newLib.myNum(3.14159));
console.log(newLib.myNum2("14732"));
console.log(newLib.myEmail("brandonmackey@fullsail.edu"));
console.log(newLib.checkURL("www.fullsail.com")); 