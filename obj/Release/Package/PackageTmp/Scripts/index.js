

$('#LoginView1_loginform').click(function(ev){
    ev.preventDefault();
    $('.login').fadeToggle('slow');
  
  
});


$j = $.noConflict();
$j(document).mouseup(function (e)
{
    var container = $('.login');

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
        
    }
});