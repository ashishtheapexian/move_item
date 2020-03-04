/*!
 * apex-Item Mvement - Oracle APEX plugin
 * @author Ashish Sahay
 * @version v1.0.0
 * @link https://github.com/ashishtheapexian/apex_item_move.git
 * @license MIT
 */
/*
 * ChageLog:
 * v1.0.0 - 20200304 - Initial Release
 */

var move_item = {

    /* Init Function*/
    init: function () {
        var da = this;
        apex.debug.log('move_item.init', da);

        /* get plugin attributes*/
        var v_itemId = da.action.attribute01;
        var vPosition = da.action.attribute02;
        var vAlignment = da.action.attribute03;
        var vNav_Menu_alignment = da.action.attribute04;
        var vbackground = da.action.attribute15;

        $('#' + v_itemId).css('background', vbackground);

        var l_item = $('#' + v_itemId).detach();
        var l_pos;
        if (vPosition == 'nav-bar') {
            l_pos = $('.t-NavigationBar');
            if (vAlignment == 'left') {
                $(l_pos).prepend(l_item);
            } else {
                $(l_pos).append(l_item);
            }
        } else if (vPosition == 'nav-menu') {
            l_pos = $('.t-TreeNav ul');
            if (vNav_Menu_alignment == 'top') {
                $(l_pos).prepend(l_item);
            } else {
                $(l_pos).append(l_item);

            }
        } else if (vPosition == 'app-title') {
            l_pos = $('.t-Header-logo');
            if (vAlignment == 'left') {
                $(l_pos).prepend(l_item);
            } else {
                $(l_pos).append(l_item);
            }
        }
        $('#' + v_itemId + '_CONTAINER').remove(); // contentainer does not require for now
    }
}
