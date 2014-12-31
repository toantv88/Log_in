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


$(function(){ $(document).foundation(); });


$("#new_user").ready(function () {
	$.validate({
	modules : 'users'
	});
	$("#new_user").validate({
		keyup : true,
		rules: {
			"user[email]": {email: true, remote:"/users/check_email" },  
			"user[password]": {minlength: 6},
			"user[password_confirmation]": {equalTo: "#user_password"}
		}
	});
});

$(document).ready(function () {

    $("#edit_user").validate({
      
        rules: {
            "user[name]": {
                required: true
            },
            "user[password]": {minlength: 6} ,
            "user[password_confirmation]":{
              equalTo: "#user_password"
            }
        }
    });

});