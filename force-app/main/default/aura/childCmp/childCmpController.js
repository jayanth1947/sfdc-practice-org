({
    // With the helper we will call the events
    showMessage : function(component, event, helper) {
        helper.showMessageHelper(component, event, 'confirm');
    },
    showError : function(component, event, helper) {
        helper.showMessageHelper(component, event, 'error');
    },
    removeMessage : function(component, event, helper) {
        helper.removeMessageHelper(component);
    }
})