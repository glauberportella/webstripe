// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require twitter/bootstrap
//= require bootstrap
//= require underscore
//= require backbone
//= require backbone-support
//= require backbone-relational
//= require backbone_rails_sync
//= require backbone_datalink
//= require best_in_place
//= require ./admin/stripe_admin
//= require_tree ../templates
//= require_tree ./admin/models
//= require_tree ./admin/collections
//= require_tree ./admin/views
//= require_tree ./admin/routers
//= require_tree ./admin

$(function(){
  restartEventHandlers();
});

var clickHandler = function(itemType) {
  return function(ev) {
    new StripeItem(itemType).render()
    restartEventHandlers();
  }
}

var removeNewItem = function(ev) {
  $(this).closest("div.stripe-item").remove();
}

var removeExistingItem = function(e) {
  e.preventDefault();
  $(this).prev().val("1");
  $(this).closest("div").children("p.fields, h4, hr").remove();
  $(this).remove();
}

var restartEventHandlers = function() {
  $(".add-new-text-item").click(clickHandler("text"));
  $(".add-new-embed-item").click(clickHandler("embed"));
  $(".add-new-image-item").click(clickHandler("image"));
  $("a.remove-stripe-item").click(removeNewItem);
  $("a#remove-existing-item").click(removeExistingItem);
  $(".best_in_place").best_in_place();
}

