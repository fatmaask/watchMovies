$(document).ready(function() {           
    if (!Modernizr.input.placeholder)
    {       
        var placeholderText = $('#search').attr('placeholder');
        
        $('#search').attr('value',placeholderText);
        $('#search').addClass('placeholder');
        
        $('#search').focus(function() {             
            if( ($('#search').val() == placeholderText) )
            {
                $('#search').attr('value','');
                $('#search').removeClass('placeholder');
            }
        });
        
        $('#search').blur(function() {              
            if ( ($('#search').val() == placeholderText) || (($('#search').val() == '')) )                      
            {   
                $('#search').addClass('placeholder');                     
                $('#search').attr('value',placeholderText);
            }
        });
    }                
});