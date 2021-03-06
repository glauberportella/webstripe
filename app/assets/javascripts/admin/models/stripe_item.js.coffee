class StripeAdmin.Models.StripeItem extends Backbone.RelationalModel
  urlRoot: '/admin/stripe_items'
  defaults:
    item_type: "text"
    content: ""

  isFirstStripeItem: (index) ->
    return index is 0

  isLastStripeItem: (index, length) ->
    return index >= length - 1

  beforeSave: ->
    @unset("created_at", {silent: true})
    @unset("updated_at", {silent: true})
    @unset("edit", {silent: true})
    @unset("edited", {silent: true})

  afterSaveImage: (result) =>
    @set({item_type: "image", content: null , image: result["image"]})

  afterSaveStripeItem: (stripe_item) =>
    item_type = stripe_item.get('item_type')
    @set({item_type: item_type})

  setPosition: ->
    @beforeSave()
    @set({position: @collection.indexOf(this)})