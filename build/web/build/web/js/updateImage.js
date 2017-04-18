    $(document).ready(function(){
     $(function() { 

    $('#done').click(function() {
        var dataValue="picture";
        var queryString = "?name=" + dataValue;

         $("form#yourform").attr('action',queryString);
         $("form#yourform").attr('enctype', "multipart/form-data");
         $("form#yourform").attr("file", $('#picture').val());
         

        $('yourform').submit(); //upload button 
             $("#txt").load(function () {
                 
                  
                  
                            $.ajax({
                                    type: "GET",
                                    url: "update" + queryString,
                                    data: "action=download",
                                    async: false,
                                    dataType: "text",
                                    success: function(result) {
                                        //do something
                                    }
                                });
                } );
            }); 
});
    
});