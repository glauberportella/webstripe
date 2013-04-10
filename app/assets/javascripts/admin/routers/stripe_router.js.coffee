class StripeAdmin.Routers.Stripe extends Support.SwappingRouter
  routes:
    'admin/stripes/new': 'new'
    'admin/stripes/:id/edit': 'edit'


  initialize: ->
    console?.log("stripe router")

  new: ->
    @el = $("div.new-stripe-container")
    @stripe = new StripeAdmin.Models.Stripe($('#stripe_items_data').data('stripe'))
    @stripe_items = new StripeAdmin.Collections.StripeItems()
    @stripe_items = @stripe.get('stripe_items')
    @swap(new StripeAdmin.Views.StripeItems({collection: @stripe_items, isFirstSlide: true}))

  edit: (id) ->
    @el = $("div.edit-stripe-container")
    @stripe = new StripeAdmin.Models.Stripe($('#stripe_items_data').data('stripe'))
    @stripe_items = new StripeAdmin.Collections.StripeItems()
    @stripe_items = @stripe.get('stripe_items')
    @swap(new StripeAdmin.Views.StripeItems({collection: @stripe_items, isFirstSlide: false}))