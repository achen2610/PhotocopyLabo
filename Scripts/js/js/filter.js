/*----------------------------------------------------*/
/*  Projects Filtering
/*----------------------------------------------------*/

$('.option-set.alt li').on('click', function (event) {
    event.preventDefault();

    var item = $(".product a"),
    image = item.find('.product a img');
    item.removeClass('clickable unclickable');
    image.stop().animate({ opacity: 1 });
    var filter = $(this).children('a').data('filter');
    item.filter(filter).addClass('clickable');
    item.filter(':not(' + filter + ')').addClass('unclickable');
    item.filter(':not(' + filter + ')').find('.themes-list a img').stop().animate({ opacity: 0.2 });
});

$('#filters a').click(function (e) {
    e.preventDefault();

    //var selector = $(this).attr('data-filter');

    $(this).parents('ul').find('a').removeClass('selected');
    $(this).addClass('selected');
});

$('.product a').on('click', function (e) {
    if ($(this).hasClass('unclickable')) {
        e.preventDefault();
    }
});

/*----------------------------------------------------*/
/*  Isotope
/*----------------------------------------------------*/

$(window).load(function () {
    var $container = $('.isotope-wrapper');
    $container.isotope({ itemSelector: '.isotope-item', layoutMode: 'masonry' });
});

$('#filters a').click(function (e) {
    e.preventDefault();

    var selector = $(this).attr('data-filter');
    $('.product.isotope-wrapper').isotope({ filter: selector });

    $(this).parents('ul').find('a').removeClass('selected');
    $(this).addClass('selected');
});