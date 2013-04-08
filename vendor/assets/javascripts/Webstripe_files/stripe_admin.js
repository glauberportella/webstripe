(function() {
  window.StripeAdmin = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    initialize: function() {
      if (typeof console !== "undefined" && console !== null) {
        console.log("StripeAdmin initialization point");
      }
      this.router = new StripeAdmin.Routers.Stripe();
      return Backbone.history.start({
        pushState: true
      });
    }
  };

  $(document).ready(function() {
    return StripeAdmin.initialize();
  });

}).call(this);
