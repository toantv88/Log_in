// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree . 
//= requery jquery.min
//= requery jquery.validate
// $(function(){ $(document).foundation(); });	
 
 
 
// required group fields
jQuery.validator.addMethod("required_group", function(value, element, param) {
    var validator = this;
    var minRequired = param[0];
    var selector = param[1];
    var validOrNot = jQuery(selector, element.form).filter(function() {
        return validator.elementValue(this);
    }).length >= minRequired;

    jQuery(selector, element.form).off('.required_group');

    if (this.settings.onkeyup) {

        jQuery(selector, element.form).on({
            'keyup.required_group': function(e) {
                jQuery(selector, element.form).valid();
            }
        });
    }
    if (this.settings.onfocusin) {

        jQuery(selector, element.form).on({
            'focusin.required_group': function(e) {
                jQuery(selector, element.form).valid();
            }
        });
    }
    if (this.settings.click) {

        jQuery(selector, element.form).on({
            'click.required_group': function(e) {
                jQuery(selector, element.form).valid();
            }
        });
    }
    if (this.settings.focusout) {

        jQuery(selector, element.form).on({
            'focusout.required_group': function(e) {
                jQuery(selector, element.form).valid();
            }
        });
    }
    return validOrNot;
});