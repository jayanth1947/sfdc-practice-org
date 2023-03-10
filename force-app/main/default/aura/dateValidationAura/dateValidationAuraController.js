({
    dateUpdate : function(component, event, helper) {
        //This will check whether the date is valid or not

        //Just creating the variables for date
        var today=new Date();
        var dd=today.getDate();
        var mm=today.getMonth()+1;
        var yyyy=today.getFullYear();

        //Add 0 to the day when it is less than 10
        if(dd<10){
            dd='0' + dd;
        }
        //Add 0 to the month when it is less than 10
        if(mm<10){
            mm='0' + mm;
        }

        //formatting the date
        var todayFormateDate= yyyy + '-' + mm + '-' +dd;

        //Checking whether the date is empty or not and it is less than the current date
        if(component.get("v.testDate") !='' && component.get("v.testDate") < todayFormateDate)
         {
             component.set("v.dateValidationError",true);
         }
         else{
            component.set("v.dateValidationError",false);
         }
    },

    //the submit button is getting alert after the error is happend
    submit:function(component, event, helper){
        var isDateError=component.get("v.dateValidationError"); //call dateValidationError
        if(isDateError != true){
            alert('Enter date is valid');
            // alert(`Enter date is valid ${testDate}`)
        }
    }
    }
)