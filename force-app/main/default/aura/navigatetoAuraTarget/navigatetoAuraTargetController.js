({
    onload : function(component) {
        var myPage=component.get("v.pageReference")
        var id=myPage.state.c__id
        component.set("v.id",id)
    }
})