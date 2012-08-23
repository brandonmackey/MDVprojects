
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
    
    
    
    return{
        "daysTill": daysTill,
        "myNum"   : myNum
    };
    
    
    
};


var newLib = new myLibrary();

console.log("There are " + newLib.daysTill("2012,07,22", "2013,06,17") + " days till my birthday!" );
console.log("I like " + newLib.myNum(3.14159) + "!");