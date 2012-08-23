
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
	    if(isNaN(oldString)){
		numToString = "Sorry items in string not numbers";
		}
		else
		{
		numToString = Number(oldString);
		return numToString;
	    };
	};










    return{
        "daysTill": daysTill,
        "myNum"   : myNum,
        "myNum2"  : myNum2
    
    
    };
    
    
    
};

var newLib = new myLibrary();

console.log(newLib.daysTill("2012,07,22", "2013,06,17"));
console.log(newLib.myNum(3.14159));
console.log(newLib.myNum2("14732"));