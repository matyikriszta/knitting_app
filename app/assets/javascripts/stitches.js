var knitApp = knitApp || {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {}
};

// represent an individual note
knitApp.Models.Pattern = Backbone.Model.extend({}); // server sets the default for us automatically

// a collections of note models
knitApp.Collections.PatternCollection = Backbone.Collection.extend({
  model: knitApp.Models.Pattern,
  url: '/patterns' // represents patterns_controller index action
});

// render a single note
knitApp.Views.PatternView = Backbone.View.extend({
  tagName: 'div',

  initialize: function() {
    this.listenTo(this.model, 'change', this.render);
  },

  render: function() {
    var templateContents = $('#tmpl_pattern').html();
    var template = _.template(templateContents);
    var resultOfRendering = template({pattern: this.model});
    this.$el.html(resultOfRendering);
    return this;
  }
});

// renders all of our notes into the page
knitApp.Views.PatternCollectionView = Backbone.View.extend({
  el: '#container',
  render: function() {
    var that = this;
    this.$el.empty(); // remove everything in our container
    this.collection.each(function(patternModel) { // for every collection in our model
      var patternView = new knitApp.Views.PatternView({model: patternModel}); // create a new noteView
      that.$el.append(patternView.render().el); // ... and draw it into the page
    });
    return this;
  }
});

//router for my app
knitApp.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "patterns": "showIndex",
    "patterns/:id": "showPattern"
  },
  showIndex: function() {
    var collectionView = new notesApp.Views.NoteCollectionView({collection: knitApp.allPattern});
    collectionView.render();
  },
  showPattern: function() {
    var patternView = new knitApp.Views.PatternView({model: knitApp.Pattern});
    patternView.render();
  },
});

// ----------- my app runs below this line -----------
knitApp.init = function(data) {
  knitApp.router = new knitApp.Routers.AppRouter();
  knitApp.Pattern = new knitApp.Models.Pattern(data);
  knitApp.allPatterns = new knitApp.Collections.PatternCollection(data);
  Backbone.history.start(); // starts the routing
}