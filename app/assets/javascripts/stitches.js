var knitApp = knitApp || {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {}
};

// represent an individual stitch
knitApp.Models.Stitch = Backbone.Model.extend({});

// a collections of stitch models
knitApp.Collections.StitchCollection = Backbone.Collection.extend({
  model: knitApp.Models.Stitch,
  url: '/stitches' // represents notes_controller index action
});

